Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131036A01E
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640842; cv=none; b=kONDUocNHMhRu+QK9sorz+F8yx0zCHOXMZLT9WEM4AkQVsoJFqiaPZuyXkCQ+Ei203OllO4EH7EVZfeU7rrEGzdVK2HuhkSpVY+eM7x5oiy1X/zFYeZPYyvM1ljJkZI72dRjPr66ezm3Rv0lBVBTvMxbZHDpeaY/tpYmE01OFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640842; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFxX4kteDHbicvt+aqd/gBg+00AvPfjn86+h4NtFZdcnwnYqgSfxfDJDaQdTGuaW+AKBhEe+3LSprlA/fRzkKwIrZi7GJ8bS+tn+0MJUWCO7GTB0vJxfIT/ShTOtNRhe3iEudYIeLdhKgD6MOZr8DYWTHnIsQ/H0xc9PTdMituA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fznZGV4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBCiSUjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fznZGV4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBCiSUjE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMPmw1352033
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=fznZGV4uujPZ9rz4
	zOVg/UlXGfAWa0YqfBxATkkWSDRnTFwKCedpMKoh6b/Ok53lBhnQR3CA3WlkEmBS
	K5iMZtpt6ZS9xXuAYK8/sScOpXqMHlVFm4pPhiX/iqsM6KPoGiTL/oc8Sy03BFOl
	GYje0ee3rlYEkjqZs+BAPUWGZonn+yjHP/xHy9CdC62Ezd7kNMlQ0s3baxZkANgd
	Hw4loQXoHYMsjfnAxzOCOG0BVuQveXiqf8IyLegCZPMH5sew34kZro4pqeYyJaFv
	uCg554WKFccEzYSE1SoebHkmnI0RvOwCGuU8jhyHcrjanTduSQtR3tYa9grtyVyF
	P89IRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2ktq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so123260481cf.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640839; x=1785245639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=bBCiSUjE3lGM0eobOLBdY7DYio6FDs1f5TXJZEoHmsesN6N+ZwdZJg3IHxFHb67j4K
         0WCTTqoVoj4demYosiW+gjcDPfqsmAYP/+1jCM1Aj6Day5qr1z2ucdixDDpZCXK4Yk5V
         ABPoKOdDGtF++NEIQxnaES1ToCsoVv016dc7qGtY3Mv4qmljCO65q8WJb0gz4C6MPb5v
         DeXfVYoPrSbfBtWp1vpSP2k6iMzihTfUmAUFtmg8rabQPOZl3N8+ajZWCXZejy6GdMOr
         n5RhXZPSblrsJGyPmm/7SsrCXu4dd541D2OAiYWlnpDj/tcQcSIOsHtcQKO9qL7v29Dj
         Bs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640839; x=1785245639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=BimmgSdGKZfzltLEcJ0/KXHcx720pH2fLRjFzjPAB5hrOtOr+m5wQGiwl+GdxCv/9o
         D7s32Iq5QEbntSRlFbxIp337rBD9y7isf4yWWDG38Nn+OZnZpGI1TpIyOBA6xbLVxDaB
         zlEhaUkxNjVnLLSIZRH+dOm0f5dCJeUno/fmagnc2snwm0lZ6Lh5+g6knqFYIIVXV/dV
         DfpmogAkS9E1n+GDFNPmZzDThtFu6ltp2S7+uftnXqStFWc+ZUj77wozRkJK/SWblysT
         tFs/cnxZjhtllgcSTZL/UZwjwiCopo/yrmY1MFMv69aHjlgksHJg21QkawKfsK35KpyQ
         BmTQ==
X-Gm-Message-State: AOJu0YzQf0fDXVyOiEzsmfc9YM12nJne9V7ud/FC+QTnM6et7KRLD7iI
	fqlh5Evsiur1QNbvFOLSXq/xJWpfxvHXGvbiGW4IgUY8hT+9z3ZWi/NqyR+qzLivQunVTLxiSay
	IR2jtNFBJHrx33Ek+aCGfWaxj8u0z2TH5ChLymlxcKBw686afuC6IpN81j/+22mXzpP6AA1c=
X-Gm-Gg: AfdE7clxHgQwPp2Z1HmNR7dFOvFh1peYYSsYTL8Za08edsj56vYWFRemluH3SYwfk8W
	wfw9eLnl73PFMOyR9Cb64f59yeKTwQDeQY4iP3eSYm+gvzS2pjV8d6U0nyzFZaj6Jwjnu/gdX1i
	sikcVS7S2K20u5+u4FRYXipylKKljFNuyUduwCs3Iro/1PJTAaoLUbAA25IpUH2mZh/7kYBzSvS
	Zfyx50sI3JoxtcXqrjeBQ5/ZdLy0mKNzia/eALUPO8uHkBwsawN7SdBLpEAWOqsNUUYDJ7Y/36a
	2WC+fSc0Eyjz+r3T5zwtYeuTcTS7AOTDtDWfFCIWbPp5MJ5j9l49uvocj6U7kwTnVAhhkBKDos4
	HZx7CR/mRI+mrzkR3An1pTjQfz71VVQ==
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172629621cf.24.1784640839408;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172629421cf.24.1784640839033;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:13 +0200
Subject: [PATCH v23 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-8-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Ul3/iDvHg4aUP3q+akLVH0AH2O/TqlOHrv4
 XiXVsg3n7aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JQAKCRAFnS7L/zaE
 w/CSEACkAW/OT+lifakWOFLO39FQXmm/C7sQQ0BvEXwrxsR6of/E0WqLCGTB6gpyCZdicqlK5HN
 VkEfYabhgAspLJDJV4N+nau20sEYLZc37UDBMjS/yFOJKAen2OM9X/lUvzH5F4k0VP4NUaZKE6s
 3Hk//Tkc5jY9fLhv1XnfvgxgLar2acM4WM8P9CknamSU1Q6gD7ngkP8SnMJem+RbxOaRXqTD5hY
 kGykFDcG1mZL15jy8jNQlBVaXxZzIxJDV9QwY401ZPAS+0KTb3hQluK7SZsRhr9sMnWRQVddJin
 r0i4jejB5wRED33HrhD4Yae0DLMSbM9g3xvdHqcwO9K31sUmOBYM08wEGZN9eHzOd3h7TOIqLin
 6gJQKZS7QbXafmqRE08WOGhUXJgU7+YkXAQISgRGHJg27TfEs/23zJW5uW33q0RGEKky+xyZrFI
 pL0QuOPEAwB4oQwvjFO0Gh0T+R06HwOwJXJvyOR5Qku/Cum4iI6DNRwHZT9XkrOc30foahJ972S
 CARntKBk+IXP4dHgceVPzaeI27iMMjbfVipWeCaALLWxtHaZjfuCYB+GoxSxSk7q6T+Fdsc2nwC
 fCdhq9jPe1dY2JYhfHylMs5mufyrbMgTMU7ojZUHyXQzK6mUl15IRcSXmmCFjjdtFFLQzaZLM0Z
 0ao6rqrkrtCZ68w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f7548 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iPjFS38Yi6XVljRxJ7qrTF6ItXDOoLCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX3EoJez+cWCDK
 uW6EvpbfM9VKwS8PTUjSClbrO3F3qfBkVyuIvqYFCPCXOURKQPwOykcSfoJcy0emCFGIKeVVkXj
 FYXNRm0+yvFEJdIM5XcYVh58mRv+2HF3EnXI1uPGl8mhJGEg3NVPLfhhLbgPEDBel9xVThqkIcu
 PHkp6vPpABdRG+USu6Y7pIqKnoHhmyLnKWK88Ei8pnwpd+TSItQ/RuQOObxZxtQaBcpQTqbuy4v
 83ACmxdrnSvjweiUjgGmXcwjSaYhxo0LoLulBLaZb8OM1gaO8f5P/srC5NRUD4UVI9YTiWe6dAP
 HXrX9vT62Pvi246Ma6PWeJODoWR7vURXXUswJxekj+r9mi4LXRZyXQMhegxXCPl+hTZShgP0pJA
 KW7iiZaZrt1T3SD3Sfu0hfO1X1QNkx9w3ZUi9OavhvDBy9dXCUV1w95zHkVJOwEG349RVoBNcB9
 FBRuzzXI7P5XUXiUOHg==
X-Proofpoint-ORIG-GUID: iPjFS38Yi6XVljRxJ7qrTF6ItXDOoLCL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6jRfn1Lwg0Uv
 HFADvH5UkR914O2Ooug0OocBEXjgFzXGq69dZnWeaus60JKhK22mAMKXFrvXFDHRaOQTHC8AqPH
 0jVS5jvyGwpJsb+wO3U/WLuJk8CfJUo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

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

