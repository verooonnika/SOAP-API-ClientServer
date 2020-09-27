public class SensorEventWrapper {
    
    public String Sensor_field;
    public Integer X_field;
    public Integer Y_field;
    public Integer Z_field;
    
    public SensorEventWrapper( String sensorId, Integer[] line){
        this.Sensor_field = sensorId;
        this.X_field = line[0];
        this.Y_field = line[1];
        this.Z_field = line[2];
    }
    
}