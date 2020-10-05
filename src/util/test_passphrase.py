import logging
import string
import random
import os
from slogger import slogger


slogger(str(os.path.splitext(os.path.basename(__file__))[0]))


def passphrase(length: int) -> str:
    alphabet = string.ascii_letters + string.digits + string.punctuation
    product = str(''.join(random.choice(alphabet) for i in range(length)))
    logging.info(" "+product)
    return(product)


def test_passphrase_10_sets_of_10():
    assert len([passphrase(10) for _ in range(10)]) == 10
