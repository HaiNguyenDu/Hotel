package BEAN;

public class RoomType {
    private String id;
    private String typeName;
    private String description;
    private Integer basePrice;
    private String bedType;

    public RoomType() {}

    public RoomType(String id, String typeName, String description, Integer basePrice, String bedType) {
        this.id = id;
        this.typeName = typeName;
        this.description = description;
        this.basePrice = basePrice;
        this.bedType = bedType;
    }

    // Getters and Setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(Integer basePrice) {
        this.basePrice = basePrice;
    }

    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }
}
