# Exter-Shop

Exter-Shop is a **QBCore-based** shop system designed for **FiveM**, allowing players to buy and sell items through a responsive and user-friendly interface.

## 🎯 Key Features
- 🚀 **QBCore Integration** - Fully compatible with the **QBCore** ecosystem.
- 🛒 **Dynamic Shop System** - Supports multiple item categories with adjustable stock.
- 🔄 **Buy & Sell Transactions** - Players can buy and sell items at predefined prices.
- 🎨 **Modern UI Design** - A sleek and responsive user interface.
- 🔧 **Flexible Configuration** - Easily customizable via configuration files.
- 🏪 **Support for Various Shop Types** - Suitable for general stores, weapon shops, and more.

## 📦 Installation

1. Download or clone the repository:
   ```sh
   git clone https://github.com/ExterCore/exter-shop.git
   ```
2. Move the `exter-shop` folder to the `[resources]` directory in your FiveM server.
3. Add the resource to your `server.cfg`:
   ```cfg
   ensure exter-shop
   ```
4. Restart your server and ensure the script is running correctly.

## ⚙️ Configuration

All settings can be adjusted via the **config.lua** file.

- **Adding a New Shop:**
  ```lua
  Config.Shops = {
      ["supermarket"] = {
          name = "Supermarket",
          items = {
              {name = "water", price = 5},
              {name = "bread", price = 10}
          },
          coords = vector3(25.7, -1345.3, 29.5)
      }
  }
  ```
- **Adjusting Prices & Stock:**
  Modify item prices and stock levels within the shop configuration.

## 📌 Requirements
- **[QBCore Framework](https://github.com/qbcore-framework)**
- **[Ox Inventory](https://github.com/overextended/ox_inventory) (Optional, if using an additional inventory system)**
- **[Exter-TextUI](https://github.com/ExterCore/exter-textui) (Required for UI interactions)**
- **[ox_target](https://github.com/overextended/ox_target) (Optional, if using target-based interaction)**

## 🛠️ Usage
- Players can interact with shops by approaching them and using the available menu.
- Transactions are processed based on available balance and stock.
- If using **ox_target**, ensure interaction targets are properly configured.

## 💡 Inspiration
This project was inspired by **[av_shops](https://github.com/avilchiis/av_shops)**, with improvements and additional features tailored for the **ExterCore** ecosystem.

## 📜 License
This project is licensed under the **MIT License**. Refer to the `LICENSE` file for more details.

## 🤝 Contributions
Contributions are highly welcome! If you’d like to add features or fix bugs:
1. Fork this repository.
2. Create a new branch (`feature-branch`).
3. Make your changes and commit them.
4. Submit a Pull Request.

## 📞 Support
If you encounter any issues or have questions, feel free to open an **issue** in this repository or reach out to the ExterCore community.

---
Created with ❤️ by [ExterCore](https://github.com/ExterCore).
