import os

file_path = os.path.abspath(__file__)

def build_clever():
    print("Building clever benchmark")
    clever_dir = os.path.dirname(file_path)
    lean4_dir = os.path.join(clever_dir, "lean4")
    os.system(f"cd {lean4_dir} && lake exe cache get && lake build")

def install_lean():
    lean_version = "4.15.0"
    print("Updating Lean")
    assert os.system("git --version") == 0, "git is not installed"
    print("[OK] git is installed")
    # Make sure that .elan is installed
    print("Checking if .elan is installed")
    if os.system("elan --version") == 0:
        print("[OK] .elan is installed")
    else:
        print("Installing .elan")
        elan_url = "https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh"
        os.system(f"curl -sSL {elan_url} -sSf | sh -s -- -y")
        print("[OK] .elan installed")
    
    # Checking if lean is installed
    print("Checking if Lean 4 is installed")
    if os.system("lean --version") == 0:
        print("[OK] Lean 4 is installed")
    else:
        lean_repo = "leanprover/lean4"
        os.system("source $HOME/.elan/env")
        os.system(f"echo 'Installing Lean 4 ({lean_repo}:{lean_version})...'")
        os.system(f"elan toolchain install {lean_repo}:{lean_version}")
        os.system(f"elan override set {lean_repo}:{lean_version}")
        os.system(
            f"echo 'Installed Lean 4 ({lean_repo}:{lean_version}) successfully!'")
        os.system("export PATH=$PATH:$HOME/.elan/bin")

        os.system("ls -l $HOME/.elan/bin")

    assert os.system(
        "export PATH=$PATH:$HOME/.elan/bin && lean --version") == 0, "Lean 4 is not installed aborting"
    print("[OK] Lean 4 installed successfully")

def install_clever():
    install_lean()
    build_clever()