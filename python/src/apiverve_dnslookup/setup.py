from setuptools import setup, find_packages

import os
lib_folder = os.path.dirname(os.path.realpath(__file__))
requirements_file = os.path.join(lib_folder, 'requirements.txt')
install_requires = ["requests >= 2.25.1", "setuptools >= 56.0.0"]
if os.path.exists(requirements_file):
    with open(requirements_file, 'r') as f:
        install_requires = f.read().splitlines()

setup(
    name='apiverve_dnslookup',
    version='1.2.1',
    packages=find_packages(),
    include_package_data=True,
    install_requires=install_requires,
    description='DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/dnslookup?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)