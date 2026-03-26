# File Interleaver Tool

<br>

## 📖 Description

File Interleaver Tool is a lightweight utility for building ordered file sequences with interval-based insertion and optional randomization.

The project was originally created to solve a real-world problem — preparing a playlist for a New Year's Eve party.  
It allows inserting a specific file (or randomly selected files from another folder) at fixed intervals within a shuffled sequence.

Although inspired by a music use-case, the tool works with **any file type**, making it a flexible solution for sequence generation and batch file processing.

<br>

---

## ✨ Features

- Automatic random shuffle of input files
- Interval-based file insertion (every N elements)
- Supports:
  - Single file insertion
  - Random file selection from a folder
- Works with any file type
- Automatic file numbering
- Creates a clean output directory (`SORTED`)
- Simple GUI built with PowerShell

<br>

---

## 🏗️ Project Structure
```
file-interleaver-tool/
│
├── run_gui.ps1            # GUI (PowerShell)
└── file_interleaver.py    # Core logic (Python)
```

<br>

---

## 🧩 Architecture Overview

The project is intentionally simple and divided into two layers:

- **GUI layer (PowerShell)**  
  Handles:
  - user input
  - file/folder selection
  - process control (start/stop)

- **Logic layer (Python)**  
  Responsible for:
  - file shuffling
  - interval insertion logic
  - copying and renaming files

This separation keeps the core logic clean, reusable, and easy to extend.

<br>

---

## ⚙️ How It Works

1. Select a folder with input files  
2. Choose:
   - a single file, or  
   - a folder containing multiple files  
3. Set the interval (e.g. every 6 files)  
4. Start the process  

The program will:
- shuffle all files from the main folder
- insert a special file every N-th position
- copy everything into a new `SORTED` folder

<br>

---

## 📌 Example

Input:

```
song1.mp3
song2.mp3
song3.mp3
song4.mp3
```

Interval = 3  
Special file = `jingle.mp3`

Output:

```
1. song3.mp3
2. song1.mp3
3. [INTERLUDE] jingle.mp3
4. song4.mp3
5. song2.mp3
6. [INTERLUDE] jingle.mp3
```

If a folder is selected instead of a single file:
- a random file from that folder is inserted each time

<br>

---

## 🚀 Getting Started

### Requirements
- Windows
- Python (available in `PATH`)
- PowerShell

<br>

### Setup

Clone the repository:

```
git clone 
```


<br>

### Run

Run the GUI:

```
./run_gui.ps1
```


If script execution is blocked:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```


<br>

---

## 🖥️ GUI Overview

The application provides a simple interface for:
- selecting the input folder
- choosing a special file or folder
- setting the interval
- starting and stopping the process

<br>

*(you can add screenshot here later)*

<br>

---

## 📄 Notes

- Original files are **never modified**
- All output files are copied into:

```
<selected_folder>/SORTED
```

- Input files are always shuffled (no option to disable)

<br>

---

## 🚧 Possible Improvements

- Option to disable shuffle
- Preview before execution
- Progress indicator
- Drag & drop support
- Standalone `.exe` version

<br>

---

## 🤝 Contributing
This project is not actively maintained, but you are welcome to fork it for personal use or experimentation.

<br>

---

## 📄 License
This project is released under the **MIT License**. See the [LICENSE](./LICENSE) file for full details.

<br>

You are free to:
- Use, copy, and modify the code for personal or commercial projects.
- Distribute and sublicense your modifications.

<br>

You must:  
- Include the original license and copyright notice in your distributed code.

<br>

> Including a license in your project is important because it tells others exactly what they **can and cannot do** with your code, protecting both you and anyone who wants to use it.
