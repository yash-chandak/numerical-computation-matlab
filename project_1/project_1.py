import numpy as np
import matplotlib.pyplot as plt
import scipy.interpolate

# Python function used to create a Taylor polynomial
def funct_poly(b):
    return -b/2.0*(1-np.sqrt(1-4/np.power(b,2)))

def method_1(b, count, target_error):

    # Calculate the root and find the error for every value of b
    root1 = -b/2.0 + np.abs(b)/2.0*np.sqrt(1.0-4.0/np.power(b,2.0))
    error1 = np.abs(np.power(root1,2.0) + b*root1 + 1)

    # Plot the error as a function of b and save the figure
    plt.plot(b, error1)
    plt.title("Error1_b%s"%count)
    plt.show()

    # Find the b value at which the error is the target error
    if count is 1:
        b_target_error = b[np.argmin(np.abs(error1 - target_error))]
        print("b value for Error1:", b_target_error)

def method_2(b, count, target_error):

    # Calculate the root and find the error for every value of b
    root1 = -b/2.0 + np.abs(b)/2.0*np.sqrt(1.0-4.0/np.power(b,2.0))
    root2 = 1/root1
    error2 = np.abs(np.power(root2,2.0) + b*root2 + 1)

    # Plot the error as a function of b and save the figure
    plt.plot(b, error2)
    plt.title("Error2%s"%count)
    plt.show()

    # Find the b value at which the error is the target error
    if count is 2:
        b_target_error = b[np.argmin(np.abs(error2 - target_error))]
        print("b value for Error1:", b_target_error)

def method_3(b, count, target_error):

    # Calculate the root and find the error for every value of b
    root3_funct = scipy.interpolate.approximate_taylor_polynomial(funct_poly, 4, 7, 1)
    root3 = root3_funct(b)
    error3 = np.abs(np.power(root3,2.0) + b*root3 + 1)

    # Plot the error as a function of b and save the figure
    plt.plot(b, error3)
    plt.title("Error3%s"%count)
    plt.show()

    # Find the b value at which the error is the target error
    if count is 3:
        b_target_error = b[np.argmin(np.abs(error3 - target_error))]
        print("b value for Error1:", b_target_error)

# Set a target error as the maximum error that is deemed acceptable
target_error = .001

# For the first method, set the range of b values to be integers between 3 and 10,000,000
b1 = np.arange(3, 10000000, 1)

# For the second method, set the range of b values to be integers between 3 and 6000
b2 = np.arange(3, 6000, 1)

# For the third method, set the range of b values to start at 2.0001 and step up
# by 1 ten-thousandths up to 3
b3 = np.arange(2.0001, 3, .0001)

# Use all methods for all range of b values to best compare the methods
method_1(b1, 1, target_error)
method_1(b2, 2, target_error)
method_1(b3, 3, target_error)

method_2(b1, 1, target_error)
method_2(b2, 2, target_error)
method_2(b3, 3, target_error)

method_3(b1, 1, target_error)
method_3(b2, 2, target_error)
method_3(b3, 3, target_error)
