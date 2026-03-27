# File Interleaver Tool

<br>

## 📖 Description

**File Interleaver Tool** is a lightweight utility for creating ordered file sequences with interval-based insertion.

The project was originally developed to solve a practical problem - preparing a playlist for a New Year's Eve party.  
It allows inserting a specific file (or a randomly selected file from a folder) at fixed intervals within a shuffled sequence of files.

Although inspired by a music use-case, the tool works with **any type of file**, making it a flexible solution.

<br>

---

## ✨ Features

- Shuffle files from a selected folder
- Insert a special file at fixed intervals
- Supports single file or folder of special files (**special files** = files inserted as interludes)
- Works with any file type
- Automatically numbers output files
- Creates a dedicated output folder (`RESULT`)
- Simple PowerShell GUI

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
  Handles **user interaction**, including:
  - selecting the main folder
  - optionally selecting a folder for special files (used as interludes)
  - setting the interval for insertion
  - controlling the process (Start / Stop)

- **Logic layer (Python)**  
  Responsible for:
  - file shuffling
  - interval insertion logic
  - copying and renaming files into a clean output folder

<br>

This separation keeps the core logic clean, reusable, and easy to extend.

<br>

---

## ⚙️ How It Works

1. Select a folder with main input files  
2. Decide how to insert special files:
   - Choose a single file, or  
   - Enable the option to select a folder with multiple files  
3. Set the interval (e.g., every 6 files)  
4. Start the process  

The program will:
- shuffle all files from the main folder
- insert a special file (or randomly selected file from the special folder) at every n-th position
- copy and rename files into a new `RESULT` folder

<br>

---

## 📌 Example

Folder structure:

```
main/
├── song1.mp3
├── song2.mp3
├── song3.mp3
├── song4.mp3
├── song5.mp3
└── song6.mp3
```

<br>

### Example 1 - Single special file

Settings:

```
Main folder: main/
Interval: 3
Special file: jingle.mp3
```

Output:

```
main/
├── song1.mp3
├── song2.mp3
├── song3.mp3
├── song4.mp3
├── song5.mp3
└── song6.mp3
│
└── RESULT/
    ├── 1. song2.mp3
    ├── 2. song4.mp3
    ├── 3. [INTERLUDE] jingle.mp3
    ├── 4. song3.mp3
    ├── 5. song1.mp3
    ├── 6. [INTERLUDE] jingle.mp3
    ├── 7. song5.mp3
    └── 8. song6.mp3
```

<br>

### Example 2 - Folder of special files

Folder structure for special files:

```
special/
├── jingle1.mp3
├── jingle2.mp3
└── jingle3.mp3
```

Settings:

```
Main folder: main/
Interval: 3
Special folder: special/
```

Output (special files randomly picked from `special/` folder):

```
main/
├── song1.mp3
├── song2.mp3
├── song3.mp3
├── song4.mp3
├── song5.mp3
└── song6.mp3
│
└── RESULT/
    ├── 1. song2.mp3
    ├── 2. song4.mp3
    ├── 3. [INTERLUDE] jingle2.mp3
    ├── 4. song3.mp3
    ├── 5. song1.mp3
    ├── 6. [INTERLUDE] jingle1.mp3
    ├── 7. song5.mp3
    └── 8. song6.mp3
```

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
