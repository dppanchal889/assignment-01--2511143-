// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "1",
    product_name: "Laptop",
    category: "Electronics",
    brand: "HP",
    price: 45000,
    stock: 10,
    warranty: "1 year",
    specifications: {
      ram: "8GB",
      storage: "512GB SSD",
      voltage: "220V"
    },
    features: ["Bluetooth", "WiFi", "Webcam"]
  },
  {
    _id: "2",
    product_name: "T-Shirt",
    category: "Clothing",
    brand: "Levis",
    price: 1200,
    stock: 25,
    material: "Cotton",
    sizes: ["S", "M", "L", "XL"],
    colors: ["Black", "Blue", "White"],
    care: {
      wash: "Machine Wash",
      iron: "Yes"
    }
  },
  {
    _id: "3",
    product_name: "Milk",
    category: "Groceries",
    brand: "Amul",
    price: 60,
    stock: 50,
    expiry_date: "2024-12-20",
    nutritional_info: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    storage: ["Keep in fridge", "Use quickly after opening"]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "1" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// This index helps MongoDB search faster when filtering by category,
// such as Electronics, Clothing, or Groceries.