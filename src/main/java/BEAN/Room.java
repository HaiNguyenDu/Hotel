package BEAN;

public class Room {
    private String roomId;
    private String bookingId;
    private String roomName;
    private String status;
    private Integer floor;
    private Integer acreage;
    private String description;
    private String customerName;
    private String checkinDate;
    private String checkoutDate;
    private String CCCD;
    private String room_type_id;
    private Integer base_price;
    private String roomTypeName;
    public Room(){}

    public Room(String roomId, String room_type_id, String roomName, String status, Integer floor, Integer acreage, String description) {
        this.roomId = roomId;
        this.room_type_id = room_type_id;
        this.roomName = roomName;
        this.status = status;
        this.floor = floor;
        this.acreage = acreage;
        this.description = description;
    }

    public Room(String roomId, String roomName, String status, Integer floor, Integer acreage, String description, String roomTypeName, Integer base_price) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.status = status;
        this.floor = floor;
        this.acreage = acreage;
        this.description = description;
        this.roomTypeName = roomTypeName;
        this.base_price = base_price;
    }

    public Room(String roomId, String bookingId, String roomName, String checkinDate, String checkoutDate, String customerName, String CCCD, String status, String room_type_id, Integer base_price) {
        this.roomId = roomId;
        this.bookingId = bookingId;
        this.roomName = roomName;
        this.customerName = customerName;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.CCCD = CCCD;
        this.status = status;
        this.room_type_id = room_type_id;
        this.base_price = base_price;
    }

    public Room(String roomId, String roomName, String status, Integer floor, Integer acreage, String description) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.status = status;
        this.floor = floor;
        this.acreage = acreage;
        this.description = description;
    }

    public Room(String roomId, String roomName, String status, String room_type_id, Integer acreage, Integer base_price) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.status = status;
        this.acreage = acreage;
        this.room_type_id = room_type_id;
        this.base_price = base_price;
    }


    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }


    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getAcreage() {
        return acreage;
    }

    public void setAcreage(Integer acreage) {
        this.acreage = acreage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }


    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(String checkinDate) {
        this.checkinDate = checkinDate;
    }

    public String getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(String checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public String getRoom_type_id() {
        return room_type_id;
    }

    public void setRoom_type_id(String room_type_id) {
        this.room_type_id = room_type_id;
    }

    public Integer getBase_price() {
        return base_price;
    }

    public void setBase_price(Integer base_price) {
        this.base_price = base_price;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }
    @Override
    public String toString() {
        return "Room{" +
                "roomId='" + roomId + '\'' +
                ", bookingId='" + bookingId + '\'' +
                ", roomName='" + roomName + '\'' +
                ", status='" + status + '\'' +
                ", floor=" + floor +
                ", acreage=" + acreage +
                ", description='" + description + '\'' +
                ", customerName='" + customerName + '\'' +
                ", checkinDate='" + checkinDate + '\'' +
                ", checkoutDate='" + checkoutDate + '\'' +
                ", CCCD='" + CCCD + '\'' +
                ", room_type_id='" + room_type_id + '\'' +
                ", base_price=" + base_price +
                ", roomTypeName='" + roomTypeName + '\'' +
                '}';
    }
}
