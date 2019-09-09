import os
import yaml

PYTHON = 'python'

def run_test(language):
    if language == PYTHON:
        os.system('pytest tests/*')


def main():
    with open('.cicd.yaml') as f:
        config = yaml.load(f)    

    language = config['language']
    run_test(language)


main()
