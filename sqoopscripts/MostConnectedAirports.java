// ORM class for table 'MostConnectedAirports'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Fri May 03 02:59:51 UTC 2019
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

public class MostConnectedAirports extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("airportID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        MostConnectedAirports.this.airportID = (Integer)value;
      }
    });
    setters.put("airportName", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        MostConnectedAirports.this.airportName = (String)value;
      }
    });
    setters.put("connections", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        MostConnectedAirports.this.connections = (Integer)value;
      }
    });
  }
  public MostConnectedAirports() {
    init0();
  }
  private Integer airportID;
  public Integer get_airportID() {
    return airportID;
  }
  public void set_airportID(Integer airportID) {
    this.airportID = airportID;
  }
  public MostConnectedAirports with_airportID(Integer airportID) {
    this.airportID = airportID;
    return this;
  }
  private String airportName;
  public String get_airportName() {
    return airportName;
  }
  public void set_airportName(String airportName) {
    this.airportName = airportName;
  }
  public MostConnectedAirports with_airportName(String airportName) {
    this.airportName = airportName;
    return this;
  }
  private Integer connections;
  public Integer get_connections() {
    return connections;
  }
  public void set_connections(Integer connections) {
    this.connections = connections;
  }
  public MostConnectedAirports with_connections(Integer connections) {
    this.connections = connections;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof MostConnectedAirports)) {
      return false;
    }
    MostConnectedAirports that = (MostConnectedAirports) o;
    boolean equal = true;
    equal = equal && (this.airportID == null ? that.airportID == null : this.airportID.equals(that.airportID));
    equal = equal && (this.airportName == null ? that.airportName == null : this.airportName.equals(that.airportName));
    equal = equal && (this.connections == null ? that.connections == null : this.connections.equals(that.connections));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof MostConnectedAirports)) {
      return false;
    }
    MostConnectedAirports that = (MostConnectedAirports) o;
    boolean equal = true;
    equal = equal && (this.airportID == null ? that.airportID == null : this.airportID.equals(that.airportID));
    equal = equal && (this.airportName == null ? that.airportName == null : this.airportName.equals(that.airportName));
    equal = equal && (this.connections == null ? that.connections == null : this.connections.equals(that.connections));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.airportID = JdbcWritableBridge.readInteger(1, __dbResults);
    this.airportName = JdbcWritableBridge.readString(2, __dbResults);
    this.connections = JdbcWritableBridge.readInteger(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.airportID = JdbcWritableBridge.readInteger(1, __dbResults);
    this.airportName = JdbcWritableBridge.readString(2, __dbResults);
    this.connections = JdbcWritableBridge.readInteger(3, __dbResults);
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
    JdbcWritableBridge.writeInteger(airportID, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(airportName, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(connections, 3 + __off, 4, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(airportID, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(airportName, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(connections, 3 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.airportID = null;
    } else {
    this.airportID = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.airportName = null;
    } else {
    this.airportName = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.connections = null;
    } else {
    this.connections = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.airportID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.airportID);
    }
    if (null == this.airportName) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, airportName);
    }
    if (null == this.connections) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.connections);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.airportID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.airportID);
    }
    if (null == this.airportName) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, airportName);
    }
    if (null == this.connections) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.connections);
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
    __sb.append(FieldFormatter.escapeAndEnclose(airportID==null?"null":"" + airportID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(airportName==null?"null":airportName, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(connections==null?"null":"" + connections, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(airportID==null?"null":"" + airportID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(airportName==null?"null":airportName, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(connections==null?"null":"" + connections, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
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
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.airportID = null; } else {
      this.airportID = Integer.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N")) { this.airportName = null; } else {
      this.airportName = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.connections = null; } else {
      this.connections = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.airportID = null; } else {
      this.airportID = Integer.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N")) { this.airportName = null; } else {
      this.airportName = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "\\N";
    }
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.connections = null; } else {
      this.connections = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    MostConnectedAirports o = (MostConnectedAirports) super.clone();
    return o;
  }

  public void clone0(MostConnectedAirports o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("airportID", this.airportID);
    __sqoop$field_map.put("airportName", this.airportName);
    __sqoop$field_map.put("connections", this.connections);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("airportID", this.airportID);
    __sqoop$field_map.put("airportName", this.airportName);
    __sqoop$field_map.put("connections", this.connections);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
