// ORM class for table 'Employees'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon May 06 04:26:52 UTC 2019
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import org.apache.sqoop.lib.JdbcWritableBridge;
import org.apache.sqoop.lib.DelimiterSet;
import org.apache.sqoop.lib.FieldFormatter;
import org.apache.sqoop.lib.RecordParser;
import org.apache.sqoop.lib.BooleanParser;
import org.apache.sqoop.lib.BlobRef;
import org.apache.sqoop.lib.ClobRef;
import org.apache.sqoop.lib.LargeObjectLoader;
import org.apache.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class Employees extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("fname", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        Employees.this.fname = (String)value;
      }
    });
    setters.put("lname", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        Employees.this.lname = (String)value;
      }
    });
    setters.put("speciality", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        Employees.this.speciality = (String)value;
      }
    });
    setters.put("dept", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        Employees.this.dept = (String)value;
      }
    });
    setters.put("eid", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        Employees.this.eid = (Integer)value;
      }
    });
  }
  public Employees() {
    init0();
  }
  private String fname;
  public String get_fname() {
    return fname;
  }
  public void set_fname(String fname) {
    this.fname = fname;
  }
  public Employees with_fname(String fname) {
    this.fname = fname;
    return this;
  }
  private String lname;
  public String get_lname() {
    return lname;
  }
  public void set_lname(String lname) {
    this.lname = lname;
  }
  public Employees with_lname(String lname) {
    this.lname = lname;
    return this;
  }
  private String speciality;
  public String get_speciality() {
    return speciality;
  }
  public void set_speciality(String speciality) {
    this.speciality = speciality;
  }
  public Employees with_speciality(String speciality) {
    this.speciality = speciality;
    return this;
  }
  private String dept;
  public String get_dept() {
    return dept;
  }
  public void set_dept(String dept) {
    this.dept = dept;
  }
  public Employees with_dept(String dept) {
    this.dept = dept;
    return this;
  }
  private Integer eid;
  public Integer get_eid() {
    return eid;
  }
  public void set_eid(Integer eid) {
    this.eid = eid;
  }
  public Employees with_eid(Integer eid) {
    this.eid = eid;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof Employees)) {
      return false;
    }
    Employees that = (Employees) o;
    boolean equal = true;
    equal = equal && (this.fname == null ? that.fname == null : this.fname.equals(that.fname));
    equal = equal && (this.lname == null ? that.lname == null : this.lname.equals(that.lname));
    equal = equal && (this.speciality == null ? that.speciality == null : this.speciality.equals(that.speciality));
    equal = equal && (this.dept == null ? that.dept == null : this.dept.equals(that.dept));
    equal = equal && (this.eid == null ? that.eid == null : this.eid.equals(that.eid));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof Employees)) {
      return false;
    }
    Employees that = (Employees) o;
    boolean equal = true;
    equal = equal && (this.fname == null ? that.fname == null : this.fname.equals(that.fname));
    equal = equal && (this.lname == null ? that.lname == null : this.lname.equals(that.lname));
    equal = equal && (this.speciality == null ? that.speciality == null : this.speciality.equals(that.speciality));
    equal = equal && (this.dept == null ? that.dept == null : this.dept.equals(that.dept));
    equal = equal && (this.eid == null ? that.eid == null : this.eid.equals(that.eid));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.fname = JdbcWritableBridge.readString(1, __dbResults);
    this.lname = JdbcWritableBridge.readString(2, __dbResults);
    this.speciality = JdbcWritableBridge.readString(3, __dbResults);
    this.dept = JdbcWritableBridge.readString(4, __dbResults);
    this.eid = JdbcWritableBridge.readInteger(5, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.fname = JdbcWritableBridge.readString(1, __dbResults);
    this.lname = JdbcWritableBridge.readString(2, __dbResults);
    this.speciality = JdbcWritableBridge.readString(3, __dbResults);
    this.dept = JdbcWritableBridge.readString(4, __dbResults);
    this.eid = JdbcWritableBridge.readInteger(5, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(fname, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(lname, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(speciality, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(dept, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(eid, 5 + __off, 4, __dbStmt);
    return 5;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(fname, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(lname, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(speciality, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(dept, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(eid, 5 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.fname = null;
    } else {
    this.fname = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.lname = null;
    } else {
    this.lname = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.speciality = null;
    } else {
    this.speciality = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.dept = null;
    } else {
    this.dept = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.eid = null;
    } else {
    this.eid = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.fname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, fname);
    }
    if (null == this.lname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, lname);
    }
    if (null == this.speciality) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, speciality);
    }
    if (null == this.dept) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dept);
    }
    if (null == this.eid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.eid);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.fname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, fname);
    }
    if (null == this.lname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, lname);
    }
    if (null == this.speciality) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, speciality);
    }
    if (null == this.dept) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dept);
    }
    if (null == this.eid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.eid);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(fname==null?"null":fname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(lname==null?"null":lname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(speciality==null?"null":speciality, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(dept==null?"null":dept, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eid==null?"null":"" + eid, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(fname==null?"null":fname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(lname==null?"null":lname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(speciality==null?"null":speciality, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(dept==null?"null":dept, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eid==null?"null":"" + eid, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.fname = null; } else {
      this.fname = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.lname = null; } else {
      this.lname = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.speciality = null; } else {
      this.speciality = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.dept = null; } else {
      this.dept = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eid = null; } else {
      this.eid = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.fname = null; } else {
      this.fname = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.lname = null; } else {
      this.lname = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.speciality = null; } else {
      this.speciality = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.dept = null; } else {
      this.dept = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eid = null; } else {
      this.eid = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    Employees o = (Employees) super.clone();
    return o;
  }

  public void clone0(Employees o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("fname", this.fname);
    __sqoop$field_map.put("lname", this.lname);
    __sqoop$field_map.put("speciality", this.speciality);
    __sqoop$field_map.put("dept", this.dept);
    __sqoop$field_map.put("eid", this.eid);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("fname", this.fname);
    __sqoop$field_map.put("lname", this.lname);
    __sqoop$field_map.put("speciality", this.speciality);
    __sqoop$field_map.put("dept", this.dept);
    __sqoop$field_map.put("eid", this.eid);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
