# merck homework task

## Preparation to work
To install all needed dependencies run such commands as follows:

* >`python -m venv venv` - creates a virtualenv for further installations and work

* >`pip install -r requirements.txt` - installs all dependencies needed to work with the project.


## The Countdown task
This is a really simple program for the countdown. The task is located in the `/countdown` directory. To start the countdown just run the command below:
>`python3 countdown/countdown.py`

 and follow the instructions.

## The Test Automation task
<b> Environment Variables set up </b>

It would be better to store all the sensitive environment variables in `.env`
 file and obtain them in the runtime via the `os.environ.get()` method. But for the simplification of the home task,  this approach is omitted, and all needed variables are hardcoded in `variables.py` file.

 For the home task the `Amazon.com` e-shop was used. This e-shop was used because it allows skip registration to be interacting with the categories, items, and cart.


 The simplest test automation framework based on `Robotframework` and `Selenium` is located in `/test_automation` directory. 

 The environment is preconfigured to run the tests on `Chrome`, however, this parameter can be theoretically changed in `variables.py` file in the respective variable.

 To run tests simply put the command in the terminal:

  > robot test_automation/test_cart.robot

  If you need to run the tests in `debug` mode, put this command instead:
  >robot -b debug.log test_automation/test_cart.robot
  
  and check the `debug.log` file which is not stored in the repository.