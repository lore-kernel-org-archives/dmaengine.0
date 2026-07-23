Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1E4766AC
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826614; cv=none; b=s27EVyCZ3BvL1QMYzfVjggGPcNahSbWESn5t4KrC8tNhuFt9+fbWD+Y76MphE7qSvSSSLU9xXuwqxMDTULnoZSzsbBCs5sGNkgPeSXbWnS4ORHgAs6ipskzP2RVthBgCHrenvVEjx4/wgVAt+H6uXmrI8TWyRpovl3wS5Urr8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826614; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hX56apIvK8AGY9DQuhwo0hqRcdl/G60w3hv6YJU3fswFSHeSEca1Xft7QTMn6O8m7hG8pMtYqG3EHW7h5w0m4chSP0agf8w3k50OtuxLu9RheLYwe6xmBmE1kIKtrEyKygFVD4vy7Fg6tuqK3AOW5+tzwl8M73xuD1wSRQnnGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7Lxjbnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTpoZalI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7Lxjbnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTpoZalI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvH973951271
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=B7LxjbnmkxUZXHF0
	L0C07w/pnWCQsRcnPxj9APVQJ+cvacENCp3pCXw7Dt7Ux0JhwCOHFJzkHK3r92rp
	PcycRnBC77OII2w4x+ZZ0Li6A4CKu4fxNbfu+u5pOvCXuj5DQTyJGpYekhqi5H+t
	9bcYyDHzP46wL66IegPdjou2M0wnDb9t/OnEp1mu+3uKUix5D6uWsVCmQDA/ES4R
	5b+/2+DPxTPdrUCwUPT8UE/ZfEScuAOH0djAar9BqaDLfenfTkgT4JJl8Dpx5BDk
	2puWi0UbS3j1tc0qBhrI5rtDjBiW560Q5Pl2EYuIOpUgJoYG12VCa8Z3Se7evwJ2
	yd8xFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9f2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c075c1e25so13468981cf.3
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826597; x=1785431397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=PTpoZalIDNKn7dCVB9MjSfLKy9iHf8JVMVi6c4EMhrrPuXYY+W4WSSJYPr0HDNcYfT
         diRfbjE1mcGSlXig4SjM3DIPQQ1JTBGDGLMshYsnLkC1rcasoNBprwSidQdX9omMjB0N
         G4jsTHnee+4gMAKoowT+OdpdS611rF0HmQgPJB2K+9F93U610AY17uMGZK0o/52E4nlC
         USTfeDgEwCLGKnYMI1MrR26VPFT2MFdJW/+a0xoZSHyIfeUGbtwqSU755e1rFrifkWqb
         YcMTfjxfC/G5xAFODdlXsyK23Kt2ZTP13E31LV7GF0IfUO74qVrkm1NCTlRsQ4lNz7kZ
         fH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826597; x=1785431397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=iianW2GvxcU9lZf9jJHe6VbVh+iKI6YvgkLR3QmLDM6zBcKX3yiUIafiFEilTOuHYD
         JLt2M5HIf5FoBE703icdmy22eCwbOzRUlHAnm2lcQJskBXot9TOaaqAQuYtqjt32AbSa
         55bWEUwK/zvj/kQocHDAlF393VFABa0oDAnt18L0XSQ1UFahz0e6a+Jr4JDjg0SHZ5bj
         S1WX0B7we1irlNguCVWU0GH/vpaLYet4atC6jZk5x8mDPwTNdEK/48EAShgrVHVT4mhG
         WlcT+6FfVHxM0Cwx/UEogVq6uqSNa2MUQgj6tY9BLVgLpUH9N+TcPYtAuP9o7Gcq4F+k
         HROw==
X-Gm-Message-State: AOJu0YyvgnAXncAWg2FR+DcbhIY5k5GBnVn/+QciGYzn74yslqvVt8+c
	RzWeJMapQ7KQk8eQL8CipWJlu6j0zMnzkLpkQRMbZC0Dx1oXUmyfM5pvlXiouBgkTDNMAnLdlZT
	7LMqyR1Wf/bbwUhdSMdEvOPGJgMqyA5RjYXtkG0SEc+r1PANIF47M6CiD7uY/8yM=
X-Gm-Gg: AR+sD114F06F8kTzxtTyDcvjIjZM4homJs/Xoolk6RTvspfszMvzylXvcMJPR4AcF9R
	wi6SBQj6BKX3bar6a22oaFJexCh1UN7o/CogJFE13NyTcvLGsdcfCCNZLsqtQ6LrkN6gAmwqjYY
	hflr0vZpm25b/hBWQFp8GFbfjeEZoq4/TeUn56w2KsZP6UJw9C7ALRKiPkaQ7WiQZ8L7XZNSGdq
	Pz7kac1lpHbCMJCK2P4P30vJnsTNLpm6d9pTHCV5HpW6Xrg1ShCpHGxVCw3KIqOz+aCeVkQ8XET
	/25QD/Q01voCKE6DhDUFlqtjVr4C2W+aTQvx0YlbJeenvGHqC3FlyaJMu5Mlu1VVljdsWfMQlsr
	mZfDd6Rw3B91gWxoci7XhSiNCuCgf
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796651cf.30.1784826596638;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796041cf.30.1784826596112;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:14 +0200
Subject: [PATCH v24 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-8-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrG0VLs+VISSBWfLayx/0GnGbzVv/3UnOYeu
 At3Nys1tmOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxgAKCRAFnS7L/zaE
 w1E5D/wOKIYx6yDd8LZ32i8TxjBbQHNdN9m1zJ8Yao3Roa38cxzQJEB1eI2zUMduHnYBaeu9tg4
 VKbKKPrK7byHWwNRhin/x8eYccQvhXXEijM7yWACZ1pJw9V4QRz+c9nM/Y2NgXXP3J0peax7wk1
 VEy3rcgfFR6ObVQI+AZR4A92sndpV3IaqIWjsFRTqjYJ6hnbhBm4cVgof6xHq4yY8+FkQcFS+0V
 Sb1Qv5ill/33pVV6WXzYfbv63h84gFSFbqm9Sx9za6+DWJLWJ1+PAtl0BU02+lG5mRFMhHi4UcY
 gMXVkAVFRQBE3BQlb4+8EZZUqT9tluw1upXIeH94iEYDCRitcD6A8+UlNVpzTrKjWs8h8VCqHQT
 fqiQrLQNSmyeEWL3ZtDSF4jXh1pwwpEXiRkYVqskDZ9ZaDIgp/PKyP1txTzjjsSsImUsXXGzygz
 evA9OqUVc8f68cdl+fMl+XtT0Kdn65NPeZE2FVIDo8KffMNHjIOJzKKFAO5HsVk8fZAhRzkFDtC
 mKH+OWiB7CINj3E6/YWyZ6igQ4Lssq6xUe0pl357qphKcYM3rJzOXeo3LxDF9EMPaIKCbjzjLrX
 vMU9OL9rpqPg41NJRPD1OvQ9e7aBowndyXwNGgE7ANqSOfrn1xGEZC3ZBPF1PLRQwDDgia66UFo
 SH+lyo5j032fUZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 30wQGPXVhw-OYzT4_xqTPEcxi_XwvU4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX9Tcfhbpng3rQ
 RWIedJ9kprT9rfAp+t1ep8UCdKcQpMLuc7d0RHZwFIvLWl4HTtqToyDJDtqNVg7LN2Mecv1AsMQ
 PVMSdMFccxBYSjL0lLqL58409jURvS0oS6HmE1VJz6JUS/hgNsw7pcOIMWIM7Tq7qLrKUaT961O
 R2DSP9supiQ6VSll9+PI2XSo8wN7t8VGfQbINrR2CqccIWqWeQ5YlFNAs50nL9BBU2puPTZyx/n
 2B7tbO+0vTU5VYzxAYg4REIjyeSqUx4LVQj5860S5bUc/M9PgpHXEjcE/P3PRita4PGWX9oORQ0
 i/EVHgtvc9Bny6BbfPTItklvrmLgk+N0DDcKfgqeL0+oy1BRB41AHKICjaB0k6YbceH9dlLMzc1
 AK1R1njrwJKC363kpXG8d6N1C2xncZy7/5Y1VbYEftiK5QMRo6UvK/Q00nOPcYuvv1G1+FmTiAQ
 iDKvI2REpZp2hoA62FA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a624ae5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX3i6D0qMWIMgt
 3uHD84tcIUIKW9P9cHy1+bndQzb05/So3LvJ6GH0k6Pn8juyuxA+ZDxyNGnUTWSmdo+xTlgoR0B
 Gc9Q4XUAKbjpESL8HHxXs/635Emk7Uw=
X-Proofpoint-GUID: 30wQGPXVhw-OYzT4_xqTPEcxi_XwvU4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3

