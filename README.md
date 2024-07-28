# Cratesearch.nvim
Cratesearch.nvim is a plugin for Rustaceans to search [crates.io](https://crates.io/) directly from their Neovim.<br>
![Cratesearch Example](https://raw.githubusercontent.com/Aityz/readme-assets/main/ss.png)<br>
## 🔥 Features
- Easily configurable, just pass the table of options to the setup function.
- Easy to use, call ``:CrateSearch [query]`` and you can search.
## 🚀 Usage
To use cratesearch, you can use the command ``:CrateSearch [QUERY]``. This will make a HTTP request to crates.io's API (endpoint is https://crates.io/api/v1), and use that data to create a window where you can view the search results. To make this easier to use, in my personal configuration I remapped ``cs`` to ``:CrateSearch``, to allow for easier searching. This is recommended if you don't have anything bound to ``cs`` yet.
## 📚 Dependencies
- Neovim >=0.9 (compiled with Lua JIT)
- Cargo (get it from [here](https://rustup.rs))
- Curl (should already be installed on most systems)
## 🛠️ Installation
<details>
  <summary>Lazy.nvim</summary>

  ```lua
  {
    'Aityz/cratesearch.nvim',
    config = function()
        require("cratesearch").setup()
    end
  }
  ```       
</details>
<details>
  <summary>Packer.nvim</summary>
  
  ```lua
  use {
      'Aityz/cratesearch.nvim',
  }
  ```
</details>

> [!NOTE] 
> You must call require("cratesearch").setup() for Cratesearch to work, lazy.nvim can do this automatically in the snippet above.

## ⚙️ Configuration
``cratesearch.nvim`` does not support configuration as of yet.
