Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515D3E7BB5
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277433; cv=none; b=Up2s8kFTADfduG5b/PxE8CGAnlqvTh6+++MCLRqXUfk2jRwk1EpoEZkjDKY5LyKiZ5GtJHrZEgkCRNGEnf5ar2Xn469MPin8Co/Y7XlGW8/39Ht9tNyO64qrNL36ob1gAo2xvu6m3juk+uZRnZyM7F3J1BH2+eBybJiwqqPBFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277433; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWNAGKoOC5/Z2qQHORotW8KsJXNOejAYXaAjpiZl/K2w5qv9fAHrOKdave5uhwdCwAq9qwftTNgjh6QV/XRVFlb2u/FxmZG+vOuQVy7M1zIWbAGKrd+lMjK7C/HRGI9TGwByaJ3mBGzhSGMSvfUNSGSZcQQ2sJ1JlgOzh/YJ/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9JPLqxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZoqGAeu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9JPLqxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZoqGAeu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cjhY662005
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=O9JPLqxsZkCgr197
	M/tpqBmxSAADbhZYhHXVwD3wXMilrw3Fc3ZntwHY/F0coinkqs0D1n0Tu7zw01j/
	U/AGROZ3OBz+Q1x46l7zOboFq7A+e8u7mlxMi2KPpel/urKTPeLYDFb5pnHiOW2q
	ayQP1LY3oFawv/9rp7zBK51fkBLS91O/P325+7APznXmBbve7w41+29L5V9gQQeY
	gUtfBEvWjx64HJBl5x/PYBW8/4W/M9pJ3hjRoI9JMrj3/8EGT2OOZlATfxaOMTE1
	djsfnG0byTLCb6H3U6hfQ9HsT6bcZ0ulCzFV8fnojOHuooUGoyFlj0lM5IUooQ33
	vEK4CA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9kgy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so136992971cf.3
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277429; x=1784882229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=fZoqGAeubn8m6hVwj3jq3s2P6GZDcKSJtYw6qmTg/VwRc5JXs+e3U9XVLKgoVSe+nY
         BhFjTjlU118jg6GrFatcne6KVtw0owJJGjsA1YvHVokV3lbFEcU31WSk7+wIUDn8wOD3
         vwE4o9lpihi3iUUzIVGA9cRundyEzM6lAtEVqF2y7YcYfqeP0jbUB1vdLb6kuSTaYwfs
         cAUKw9tt5u90S1Y8U1iGQSIEHsx1EsuBpzSKRbfizy/jvk4B/fbMA2EqiptMES4I32w7
         ERXXjlVfDzfyD6AogrijjBplfaQRx+P1ymJCcTaD8vSZ9/ECszh5VrfeEciA50h0xpkD
         T2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277429; x=1784882229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=M9kITwudLI4VjDGltIBK0U7aQwBtC41OvvPlQU+ytD1YDT4H+mwD4NoY8Bf+kb4a0k
         i1KHny9VItNYlZMdEcjCw5WkSH/CfxL7qyUbQUA49EqprIOWRNXG4lckKtn0hY9xKmz4
         K6gLub4R4TVfiOpWeLF/ygGVu1bRx0/Y09u8bOr9qttXhOBkX6+E6370rA7lD6knGXUW
         4bjRRtZ4xtbQQxmlTll3W7JZt9oGHizu9j8yB3wUrmVlp3Gxs2RpVMv8x4Bzc7tNwOtI
         wO4Z59JY/vnSceMpdM/aEg+45ZnKE7IeHLWoFbynsnfwOK1u4ZFtZ9Pq5Yf2+1tYx534
         1UnA==
X-Gm-Message-State: AOJu0Yy6451YoONm9MFQ1L/CYCLXqn8/8oJrfxO1LXaY22piYRJRx66q
	4fjrTg8HkpJ7rYfHu1yVwulA9xwHY+e+iL/oQM3O50wd9OKeCNE4yDsgrPgPMJDNt2x6eaJ6326
	qbkmSGF3dE150SqLUKZjJnj4uF5yjJkGWHQNGQuLVpPpvp1IzSJSNY+4bPw+DoOY=
X-Gm-Gg: AfdE7cnAs9qFd+LZG4q88TsJlNmnNlpVdJaTmSFX6Ea9qmj6jV/IJwgSgtncijJT9Vs
	eq4F32+7AL7pBPxyJ0PRCDcJmrGUxqboum+Gm7sJ91Dspb7UrATQAa+KLcnwjQpk5nBokCVhuyM
	AXXfoQZ8WAQDW3b6FQ5F9A0w4OQ3urDY5hYgfXqUZHUDJ8MOKmgE8w+F3soP+mPMXjvv26eqt17
	aacIyim09kjbnjK5VR6F6uQRcS1rsT7I+wj+lXJgxlbLUKyLe9ag+bXpvbFD6IxtGjnlWVyEVII
	xuNa3AmbewcT/ceIqgiUtxUCbJo1D+7yyrft8L53FDlmojV8mSRIFu+EwgtP046BQxlUQgbNfAI
	3pb/DV7ySBlwOHLgukRpNvBVvD0LWHg==
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943421cf.46.1784277429609;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943321cf.46.1784277429116;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:34 +0200
Subject: [PATCH v22 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-8-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemd6cehoOTSgO5KMuQ6mnv8y35bchs1VbAIH
 /rdTqYrAteJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w7vND/9DxMXd0FXloN6YHYOW6Iw51rxkoLImPEgptMEsGc2uqcMLZrvk/mg7ZWygXJFnZjmEL44
 cceP2ouO6GzVURWecwAyquDtun93JntyCV4ZvcD737qZGhv36Xs4ZKolZbLpKOP8lXFxs69Lekg
 ud70LPwoYhBuOBA0wNw/wiaiIVyK9x8QwPvyGMwal27oisVsGw4tro9wneK75y5Wh2bBOsFsJoO
 Z3N78KsB0JCsMfKjTkq8cIdpOu3jgnZdxQdwMXQKk43sHATCzHWLfiFyhlmivLEaGdKg8w8p467
 PW/cjNI9/wxmjTVd/LxKLogNptkmTHi7lvV0oC7HkeZlkI6X7qKkBBMZK0IzRd3gEX5TPoZ8QAR
 TTlXbnVZ6WoEMmM2cpgbNWVL6igCGE6XlfsHJS4ySsyn5A7X4CcgrytCW3KMtUMpmaOLRAxplT4
 mvQ9h/eA7Z/OrhTuk97AQbrVX+j2vLp50BHgrvQYAREPx1UdO7JR/3k/IkX1fdbpTpUaMEtgFT/
 uxuYYlivYgZXGx1ElH9NtNtEH+zYx8CWaezhWCTXz1cxBjMAANRULiQCTmYIa1Csie9jjst9gkz
 zIrXJ5q8UU+cleRDwV6R17pW2YCdNIEIEAx+IAgr09iCmTwRZx6m3CnrWlgqfQcPcRzaYcAFhkk
 uqpAA5FXfTRmagw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59e9b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX9dpT1nNMF+/6
 9bHRynCuJp8sQIIWQASAKEAaayWEswvIt24Kn00KG8ezwvSAE+4gTMsfgo7H3zAGIwF3Zksf/N4
 HRBqhMjXY08zdAG4c7My/mpXTS2Gb2ylArmDdBxhU/QDb5ApqSIaleCa48xC+2YxCH/LQreBrYa
 hr9Z93V+aClwRQ4WElAqSW4mcv2E76Ax9jM8uJL0f2ySGPfrxdbC91/j0N4p3UTQMmxcK0Kw/IK
 8U/2zXeLZsFCV27RJXjyY14T6V0GPQqUFME1ZnaynaCFBD7TQZbC7ywog9rQoxYi9W3LmKKy6es
 fTPJLmMGkiE+EhsJNP1tlxxDbUE/0RvpmaJ4MEYm5HjhOKscM4PcypFueKbq79ndRxFWVX//xiv
 +X8rAgcurDXkJqh8wg9QpAqrDCobqmodGn9iNzImfS7kdFj0s4h3q3yvR2B5l675V41MIq0wBVz
 XOpiak4sP6PVj9TLiwg==
X-Proofpoint-GUID: icxiWtroRHmW1NvEB_-Z2wOvPIIUmcm1
X-Proofpoint-ORIG-GUID: icxiWtroRHmW1NvEB_-Z2wOvPIIUmcm1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX4luBlJTAioRa
 rMKieUm3m6sHmbn1O3Z8R0w4+RHF/5MaTJ6DBGGQBjHRQMPc1qJQIDdcJvg+MiQLqY+BD8KFau3
 A7IQaBPTaSpsKIjF3on2ju+7zfCY7Dk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

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

