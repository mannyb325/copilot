# Ubuntu 24.04 LTS (Noble Numbat) Upgrade Guide

## Summary
This repository has been upgraded to use Ubuntu 24.04 LTS (Noble Numbat), the latest Long Term Support release. This upgrade ensures access to the latest features, improved security, and extended support until April 2029.

## What's New in Ubuntu 24.04 LTS

### Key Features
- **Linux Kernel 6.8**: Latest kernel with improved hardware support and performance
- **Enhanced Security**: Updated security frameworks and default configurations
- **Developer Tools**: Latest versions of build tools, compilers, and development environments
- **Container Support**: Improved Docker and container runtime support
- **Package Updates**: Updated versions of Python (3.12), Node.js, and other development tools

### Development Environment Improvements
- **Python 3.12**: Latest Python with improved performance and new features
- **GCC 13**: Updated compiler with better optimization and standards compliance
- **Git 2.43+**: Latest version control features
- **Enhanced Package Management**: Improved APT with better dependency resolution

## Upgrade Implementation

### CI/CD Workflows ✅
- **GitHub Actions**: All workflows now use `ubuntu-24.04` runners
- **Multi-language Support**: CI pipelines for Python, Rust, and JavaScript
- **Compatibility Testing**: Automated testing across different language versions
- **Weekly Compatibility Checks**: Scheduled runs to ensure ongoing compatibility

### Files Updated
- `.github/workflows/ci.yml` - Main CI pipeline using Ubuntu 24.04
- `.github/workflows/ubuntu-test.yml` - Ubuntu-specific compatibility testing
- `README.md` - Updated with Ubuntu 24.04 development setup instructions

## Development Environment Setup

### Prerequisites (Ubuntu 24.04)
```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install essential development tools
sudo apt install -y build-essential curl wget git vim

# Install version control
sudo apt install -y git

# Install text editors and IDEs support
sudo apt install -y code  # VS Code (if using snap)
```

### Language-Specific Setup

#### Python Development
```bash
# Python 3.12 comes pre-installed on Ubuntu 24.04
python3 --version  # Should show Python 3.12.x

# Install pip and development tools
sudo apt install -y python3-pip python3-venv python3-dev

# Create virtual environment
python3 -m venv copilot-env
source copilot-env/bin/activate
pip install --upgrade pip
```

#### Rust Development
```bash
# Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Verify installation
rustc --version
cargo --version
```

#### Node.js Development
```bash
# Install Node.js LTS
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify installation
node --version
npm --version
```

## Testing the Upgrade

### Automated Testing
The repository includes comprehensive CI/CD pipelines that test:
- Python code syntax and compatibility (versions 3.9-3.12)
- Rust code compilation and formatting
- JavaScript/Node.js compatibility (versions 18, 20, 22)
- Ubuntu 24.04 system compatibility

### Manual Testing
To test your local environment:
```bash
# Clone the repository
git clone https://github.com/mannyb325/copilot.git
cd copilot

# Test Python files
python3 -c "import py_compile; py_compile.compile('point.py')"
python3 -c "import py_compile; py_compile.compile('sql.py')"

# Test Rust file
rustc --crate-type bin server.rs

# Test JavaScript file
node -c testgen.js
```

## Migration Notes

### Breaking Changes
- **Python**: Some older Python packages may need updates for Python 3.12 compatibility
- **Node.js**: Older Node.js versions (< 18) are no longer supported in CI
- **System Libraries**: Some system libraries have been updated and may require application updates

### Compatibility
- **Backward Compatibility**: Ubuntu 24.04 maintains compatibility with most software from 22.04
- **Container Images**: Docker containers should be updated to use Ubuntu 24.04 base images
- **Dependencies**: All major development tools and libraries are available and updated

## Support and Resources

### Official Documentation
- [Ubuntu 24.04 Release Notes](https://wiki.ubuntu.com/NobleNumbat/ReleaseNotes)
- [Ubuntu 24.04 Security Features](https://ubuntu.com/security)
- [Developer Resources](https://developer.ubuntu.com/)

### Migration Help
- [Upgrade Guide from 22.04](https://ubuntu.com/tutorials/upgrading-ubuntu-desktop)
- [Package Changes](https://wiki.ubuntu.com/NobleNumbat/ReleaseNotes#Package_changes)

### Project-Specific
- GitHub Actions logs show detailed Ubuntu 24.04 environment information
- Weekly compatibility tests ensure ongoing stability
- Issues can be reported in the repository's issue tracker

## Verification Checklist

### Pre-Upgrade ✅
- [x] Audited current Ubuntu usage across the project
- [x] Identified all configuration files requiring updates
- [x] Planned CI/CD workflow migrations
- [x] Documented upgrade process

### Implementation ✅
- [x] Updated GitHub Actions workflows to ubuntu-24.04
- [x] Created comprehensive CI/CD pipelines for all languages
- [x] Added Ubuntu compatibility testing
- [x] Updated documentation and setup guides

### Post-Upgrade ✅
- [x] Verified all CI/CD pipelines pass on Ubuntu 24.04
- [x] Tested development environment setup instructions
- [x] Confirmed compatibility with existing codebase
- [x] Documented new features and improvements

---

**Upgrade Status**: ✅ **Complete**  
**Ubuntu Version**: 24.04 LTS (Noble Numbat)  
**Support Until**: April 2029  
**Last Updated**: December 2024