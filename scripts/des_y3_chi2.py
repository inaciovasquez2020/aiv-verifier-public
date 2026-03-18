# ./scripts/des_y3_chi2.py

import numpy as np
from scipy import stats


def compute_chi2(observed, expected):
    """
    Compute the chi-squared statistic for two arrays.
    """
    observed = np.asarray(observed)
    expected = np.asarray(expected)
    chi2 = np.sum((observed - expected) ** 2 / expected)
    df = len(observed) - 1
    p_value = 1 - stats.chi2.cdf(chi2, df)
    return chi2, df, p_value


def main():
    """
    Example usage of compute_chi2.
    """
    # Example data
    observed = [10, 20, 30, 40]
    expected = [12, 18, 33, 37]

    chi2, df, p = compute_chi2(observed, expected)
    print(
        "Chi2: {}, Degrees of Freedom: {}, p-value: {}".format(
            chi2, df, p
        )
    )


if __name__ == "__main__":
    main()
