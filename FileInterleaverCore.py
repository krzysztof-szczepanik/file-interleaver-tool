import os
import shutil
import random
import sys



# ================================== ARGUMENT CHECK ===============================
# argv[0] = script name
# argv[1] = main folder
# argv[2] = interlude file or folder
# argv[3] = interval for inserting the interlude
if len(sys.argv) != 4:
    print("Usage: FileInterleaverCore.py <folder> <file> <interval>")
    sys.exit(1)

folder = sys.argv[1]
special_path = sys.argv[2]
interval = int(sys.argv[3])



# ============================= CREATE OUTPUT FOLDER ==============================
output_dir = os.path.join(folder, "RESULT") # output_dir gets a path like: folder\RESULT
os.makedirs(output_dir, exist_ok=True)      # creates the folder only if it doesn't exist



# ================= READ ALL FILES IN FOLDER (WITHOUT SUBFOLDERS) =================
files = []

for file in os.listdir(folder): # iterate through the given folder
    if os.path.isfile(os.path.join(folder, file)):
        files.append(file) # if it's a file (not a folder), add it to the list

random.shuffle(files) # shuffle files randomly



# ========================= CHECK WHAT 'special_path' IS ==========================
special_files = []

if os.path.isfile(special_path):
    # if it's a single file
    special_files.append(special_path)
else:
    # if it's a folder with files
    for file in os.listdir(special_path):
        full = os.path.join(special_path, file)
        if os.path.isfile(full):
            special_files.append(full)



# ==================================== COPYING ====================================
counter = 1 # number for the file name
index = 0   # index in the files list

# Main copy loop:
while index < len(files):
    # At every n-th position, insert a random interlude file:
    if counter % interval == 0:
        special_random = random.choice(special_files) # choose a random interlude
        special_file_name = f"{counter}. [INTERLUDE] {os.path.basename(special_random)}" 
        shutil.copy2(special_random, os.path.join(output_dir, special_file_name)) # copy interlude to output folder with new name
    else:
        src = os.path.join(folder, files[index])
        file_name = f"{counter}. {files[index]}"
        shutil.copy2(src, os.path.join(output_dir, file_name))
        index += 1

    counter += 1

print("DONE", flush=True)