import scipy.stats as stats
import numpy as np
def calculate_expression():
    # 找到标准正态分布逆累积分布函数 F^{-1}(0.94)
    inverse_cdf = stats.norm.cdf(np.sqrt(1000)*0.07)
    
    # 计算 2(1 - F^{-1}(0.94))
    result = 2 * (1 - inverse_cdf)
    
    return result

# 调用函数并打印结果
result = calculate_expression()
print(f"The result of the expression is: {result}")

print(2*(530*np.log(53/50)+470*np.log(47/50)))
print(2*np.exp(-0.5*(np.sqrt(1000)*0.06)**2))