import os
import yaml

PYTHON = 'python'
base_path = 'ITI/'
config_path = base_path + '.cicd.yaml'
test_path = base_path + 'tests/*'

def run_test(language):
    if language == PYTHON:
        os.system('pytest {}'.format(test_path))


def main():
    with open(config_path) as f:
        config = yaml.load(f)    

    language = config['language']
    run_test(language)


main()
