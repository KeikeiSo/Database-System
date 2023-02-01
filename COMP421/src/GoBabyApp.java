import java.sql.*;
import java.sql.Date;
import java.util.*;
import java.util.concurrent.TimeUnit;

import static java.util.Objects.isNull;

class GoBabyApp {
    public static Connection connectToDB(String your_userid, String your_password) throws SQLException {
        System.out.print("Connecting to database... \n");

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
//        String your_userid = null;
//        String your_password = null;
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!\n");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!\n");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;

        System.out.println("Connected.\n");
        return con;
    }

    public static String prompt(Scanner sc, String msg) {
        while(true) {
            System.out.print(msg);
            String input = sc.nextLine().trim();
            if(input.isEmpty()) continue;
            return input;
        }
    }

    public static boolean verifyMidwife(Connection con, String pracid) throws SQLException{
        PreparedStatement queryMidwife = con.prepareStatement("SELECT pracid\n" +
                "FROM midwife\n" +
                "WHERE pracid = ?;");
        queryMidwife.setString(1, pracid);
        ResultSet rs = queryMidwife.executeQuery();
        if (rs.next()) return true;
        return false;
    }

    private static String isPrimary(String pracid, String ppracid, String bpracid) {
        if(ppracid.equals(pracid)) return "P";
        if (bpracid.equals(pracid)) return "B";
        return "E";
    }

    // return key appmid, values [coupleid, pregnum, mothername, hcardid]
    public static Map<String, List<String>> getAppointmentsByDate(Connection con, String pracid, Date date) throws SQLException {
        PreparedStatement queryAppointment = con.prepareStatement("SELECT appmid, coupleid, pregnum, time, name, hcardid\n" +
                "FROM appointment, mother\n" +
                "WHERE hcardid IN (SELECT hcardid\n" +
                "FROM couple\n" +
                "WHERE couple.coupleid = appointment.coupleid)\n" +
                "AND pracid = ?\n" +
                "AND date = ?\n" +
                "ORDER BY time;");
        PreparedStatement queryPregnancy = con.prepareStatement("SELECT ppracid, bpracid\n" +
                "FROM pregnancy\n" +
                "WHERE  coupleid = ?\n" +
                "AND pregnum = ?;");
        // execute SQL statements
        queryAppointment.setString(1, pracid);
        queryAppointment.setDate(2, date);
        ResultSet rs = queryAppointment.executeQuery();
        Map<String, List<String>> result = new HashMap<>();
        // print all appointments info
        while (rs.next()) {
            // get all infos
            String appmid = rs.getString(1);
            String coupleid = rs.getString(2);
            String pregnum = rs.getString(3);
            String time = rs.getString(4);
            String mothername = rs.getString(5);
            String hcardid = rs.getString(6);
            // print necessary info
            StringBuilder info = new StringBuilder(appmid);
            info.append(":  ");
            String primary = "P";
            queryPregnancy.setString(1, coupleid);
            queryPregnancy.setString(2, pregnum);
            ResultSet rs1 = queryPregnancy.executeQuery();
            if (rs1.next()) {
                primary = isPrimary(pracid, rs1.getString(1), rs1.getString(2));
            }
            info.append(time.substring(0, time.length() - 3));
            info.append(" ");
            info.append(primary);
            info.append(" ");
            info.append(mothername);
            info.append(" ");
            info.append(hcardid);
            System.out.println("\n" + info.toString() + "\n");
            // store necessary info
            List<String> appminfo = new ArrayList<>();
            appminfo.add(coupleid);
            appminfo.add(pregnum);
            appminfo.add(mothername);
            appminfo.add(hcardid);
            result.put(appmid, appminfo);
        }
        return result;
    }

    public static void getNotes(Connection con, String coupleid, String pregnum) throws SQLException {
        // prepare and execute sql query
        PreparedStatement queryNotes = con.prepareStatement("SELECT timestamp, content\n" +
                "FROM notes\n" +
                "WHERE appmid IN (SELECT appmid\n" +
                "FROM appointment\n" +
                "WHERE coupleid = ?\n" +
                "  AND pregnum = ?)\n" +
                "ORDER BY timestamp DESC;");
        queryNotes.setString(1, coupleid);
        queryNotes.setString(2, pregnum);
        ResultSet rs = queryNotes.executeQuery();
        // loop and print all results
        while(rs.next()){
            String time = rs.getString(1).split("\\.", 2)[0];
            System.out.println(time + " " + rs.getString(2));
        }
        System.out.println("\n");
    }

    public static void getTests(Connection con, String coupleid, String pregnum) throws SQLException {
        PreparedStatement queryTests = con.prepareStatement("SELECT prescdate, type, result\n" +
                "FROM tests\n" +
                "WHERE coupleid = ?\n" +
                "AND pregnum = ?\n" +
                "AND babyid IS NULL\n" +
                "ORDER BY prescdate DESC;");
        queryTests.setString(1, coupleid);
        queryTests.setString(2, pregnum);
        ResultSet rs = queryTests.executeQuery();
        // loop and print all results
        while(rs.next()){
            String result = rs.getString(3);
            if (isNull(result)) result = "PENDING";
            System.out.println(rs.getString(1) + " [" + rs.getString(2) + "] " + result);
        }
        System.out.println("\n");
    }

    public static void addNote(Connection con, String appmid, String content) throws SQLException {
        PreparedStatement numNotes = con.prepareStatement("SELECT count(noteid) FROM notes;");
        ResultSet rs = numNotes.executeQuery();
        int nodeid = 0;
        if (rs.next()) {
            nodeid = rs.getInt(1) + 1;
        }
        PreparedStatement insertNote = con.prepareStatement("INSERT INTO notes (noteid, timestamp, content, appmid)\n" +
                "VALUES (?, ?, ?, ?);");
        insertNote.setInt(1, nodeid);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        insertNote.setTimestamp(2, timestamp);
        insertNote.setString(3, content);
        insertNote.setString(4, appmid);
        insertNote.executeUpdate();
    }

    public static void addTest(Connection con, String pracid, String coupleid, String pregnum, String type) throws SQLException {
        PreparedStatement numTests = con.prepareStatement("SELECT count(testid) FROM tests;");
        ResultSet rs = numTests.executeQuery();
        int testid = 0;
        if (rs.next()) {
            testid = rs.getInt(1) + 1;
        }
        PreparedStatement insertNote = con.prepareStatement("INSERT INTO tests (testid, type, sampledate, pracid, prescdate, coupleid, pregnum)\n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?);");
        insertNote.setInt(1, testid);
        insertNote.setString(2, type);
        Date today = new Date(System.currentTimeMillis());
        insertNote.setDate(3, today);
        insertNote.setString(4, pracid);
        insertNote.setDate(5, today);
        insertNote.setString(6, coupleid);
        insertNote.setString(7, pregnum);
        insertNote.executeUpdate();
    }


    public static void main (String [] args) throws SQLException {
        Connection con = connectToDB("qsu6", "xNW7gj6M");

        Scanner sc = new Scanner(System.in);
        while(true) {
            String input = prompt(sc,"Please enter your practitioner id [E] to exit:");
            if (input.equalsIgnoreCase("E")) break;
            if (verifyMidwife(con, input)) {
                String pracid = input;
                while (true) {
                    input = prompt(sc, "Please enter the date for appointment list [E] to exit:");
                    if (input.equalsIgnoreCase("E")) break;
                    Date date = Date.valueOf(input);
                    Map<String, List<String>> appms = getAppointmentsByDate(con, pracid, date);
                    if (!appms.isEmpty()) {
                        while(true) {
                            input = prompt(sc, "Enter the appointment number that you would like to work on.\n" +
                                    "[E] to exit, [D] to go back to another date :");
                            if (input.equalsIgnoreCase("E")) break;
                            if(input.equalsIgnoreCase("D")) break;
                            String appmid = input;
                            while (true) {
                                List<String> appminfo = appms.get(appmid);
                                String coupleid = appminfo.get(0);
                                String pregnum = appminfo.get(1);
                                System.out.println("For " + appminfo.get(2) + " " + appminfo.get(3));
                                input = prompt(sc, "\n1. Review notes\n" +
                                        "2. Review tests\n" +
                                        "3. Add a note\n" +
                                        "4. Prescribe a test\n" +
                                        "5. Go back to the appointments.\n" +
                                        "\n Enter your choice:\n");
                                if (input.equals("1")) {
                                    getNotes(con, coupleid, pregnum);
                                    try {
                                        TimeUnit.SECONDS.sleep(2);
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                    }
                                } else if (input.equals("2")) {
                                    getTests(con, coupleid, pregnum);
                                    try {
                                        TimeUnit.SECONDS.sleep(2);
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                    }
                                } else if (input.equals("3")) {
                                    input = prompt(sc,"Please type your observation:");
                                    addNote(con, appmid, input);
                                } else if (input.equals("4")) {
                                    input = prompt(sc, "Please enter the type of test:");
                                    addTest(con, pracid, coupleid, pregnum, input);
                                } else if (input.equals("5")) {
                                    appms = getAppointmentsByDate(con, pracid, date);
                                    break;
                                } else {
                                    System.out.println("Please enter a valid number.");
                                }
                            }
                        }
                    } else {
                        System.out.println("No appointment for date: " + input + "\n");
                    }
                    if (input.equalsIgnoreCase("E")) break;
                }
            }
            if (input.equalsIgnoreCase("E")) break;
            System.out.println("Practitioner id entered does not exists.\n");
        }

    }
}
