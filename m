Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF46374182
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640846; cv=none; b=GsG1gh85XNBK8a7Tp7dNAEhFO+WUgt7/8vz1hTAiTMAMr5jDukZ8SoKAHhD9lDais+frgsP8lKKspmlTolUOqXD7bLMjzUQjpXeaSd39fxYHuZGvv9ggiJoc/B79bLje5IYrxn26ZwEgO5scIdxKWOOacGlUQm88GD7aFqi3MTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640846; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS7XZ7PdM1WRFVmCucVOor5+XHRVF5HIb/De5sRgoZPL1ftfDnTJtR4vQiYRwyop3Rj0pnjvbuLkzx4J/AQoGGGLTByLPeWdeAjrCkoXsyGENBucuGbAQ5yg1TDIXPqCpi6yF40PgP3SP0rY3jpA/JcAMrWZh+oIXx0J53NGFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6/MAT0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS8WXKnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6/MAT0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS8WXKnh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMM0q1544895
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=o6/MAT0bVMJGg42J
	i32afc4DY4EC8niDPtbZJXNmErFCVSAIkPjkUn4fz8Se4gv69IxfSY3l7PPgatsX
	zf/7zpjjdU+23nzm6VeuXp9CGTGEPqHNoUeKJLxhdXhnlr0SSPXsO0dL4e/PToEg
	cHb/NF9xk1+enamy6VQRjOCB7GNQCkGCMOJJddqj/LsA/gdKiu76FltZ3FVjsS8v
	BpPrNuzqBtSP0ifL5E7KPixhLwZhfNyjWTgbghawlq2iPbPm9zBuEpbmiWdAUrNr
	hANsfYAPALH7UW9gUvWkzHEOYUGB09EGbUwS0/HZrrqHCoN8TEgGEJNnon8+0RFD
	vMErTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2yxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so165116511cf.0
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640842; x=1785245642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=FS8WXKnh6eimg1QTqxjJuE16PAXi9jcVUCQd37aLpizpL6+GmNUBAhS0qjn6kZ/Iqn
         016iOJ3VDM+WmYH5w0nm4VZFj2LtaXEUaCGuQpGvoaLr0c6mkZvoankpc2cRRW156KjY
         G3Q4+geLqBMLLm30xyvW6/2okSSz9rtl5aQ05owdBVuLd6j3cRrPCsTaluxtEJe3Ftfa
         m2AsHnrV2w+Cf3F+TuC5IylxsL6tVY6pJ3lgirRLxbJEmU95zsc1cYVQrE/p/38WbVEt
         rn67G79U6SD5CBCrhEzCv9ahzP9QQbEZ7Sd6HLNOmOCrfnZIObYccZXFMsq+pQbInBGD
         +/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640842; x=1785245642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=MPAH4j+6SPPC4+unAF+HDepzV1zfW/m1OD2P/6Rsidk+teeEl9ESageVW/lFKWiwVK
         pM3sZocnRlI2oQhghtl5uY9Kpfa3slDvP9imSqd98MyDEwsdPsBJB54LRU0i/Rvajg11
         GvwSMlAnxaN2OnV7H2mg/CydLwFdYVVsKdkGoEsTyWQZp9YBe4J7VE7sUjqq8oqcZQ5N
         UgFSq1i/9Xr59sQXCiH9gyIy7mZaRCE+DmklaES4vODT+8VtT//6lzojLsLClRQFHu3f
         wSLG+I1LzzFjukCo56eZXDienrDLuzUmoPWESaaJOv6nxUyX/FPBkhlrhet/33I+Nz9h
         xsnQ==
X-Gm-Message-State: AOJu0YxoKUqzT334HkpiQx64+9gAX4bp4V2EfJzN0ab5ButO57u/+fn8
	LBARIG8sXR6mXPduoV/CZ/7dsQ5FXQj4q1cXM+SKEednWa2XJcuxyhmBprMAB+pGXaedT5PmkN6
	XWZj3+dr8swk9WiuTdaCaefZK/h5A0WPcciqJRj3HWmF/sYXgKmKQiObeY78/5/M=
X-Gm-Gg: AfdE7cmmC1dbGReHPspYJlpsF8vdrDwPNEaCuW+7PdNqmt9b0mP3y8xkMj2sBk8VHvQ
	yGb8JgjG08lHFNpEK+B6yRRPUXiQ4srTs9Hg5mYehbXIQqJwseE4luFoX4EtnB47uKYz882w1iF
	jD1ayZtuCVYfddK3q8btI1glOBh+21PwkYADl7+Cv4tIOVN68L7LbO2XvjDffPG7QOC0dGSzzdL
	yahhCVPfyVuuNE80MNdwmTQIRjzQsdIkn6vLsyHkvUcf6UdbJ7slI7cyEuj3KQiaXAQp3GQ4bzn
	t+bsDLIVEDM9C4B4Y3ZB8KLetgnsoNBAPUl2KScA9NRSWpx9CnsWgTmEJXPlKkLcKGV5TLAj2a7
	fnp6pkpG1rHi+DSlo0oAiAu130iCflA==
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50713911cf.0.1784640842306;
        Tue, 21 Jul 2026 06:34:02 -0700 (PDT)
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50713441cf.0.1784640841870;
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:14 +0200
Subject: [PATCH v23 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-9-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UmKxOf6XYLZXDGszszberRtz3YMnxxcysIg
 9wCyls4v0CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JgAKCRAFnS7L/zaE
 wyWNEAC6YTYGYL5Tmdztdv9YHscz6FqTO3G1BxoZMQypB3nMZFhflG95fXlIphbCzz/4DhGmszJ
 9i+6ZPNgF0FkJeZyjVZDjGOyb2MGFFHD94vHOYlWsJYmrIE8d9WK/dhYE7AxkISS23Eb0sHXtcr
 lH5uQPEge6eFoHZO8oPT35dVNP/2pEQWyXskL6OZmh6kpVJ+HL3SI9NB8A+Nm3THzNRQvxzTE67
 sejCFjHbuE9HLGZxf8znL+D88EiEYc5FrG2OjYkXMhRiz73YnYE/aztnXxEgjEhmelv97/dvyEA
 EmYlFoHs9BB0o2A8u2P7I9O9jc+k50VX+i+/Q9veFoC5jnHVW/YK4BgYTN+g/HKMeUj5MbY8WqA
 Zu0PKEqBNMQNAPsGGhWB2xF2cvNRLMbzQHa0YjVMYEWiImRh9SdGH9CMCr6U6j69WvuZoYpVhc0
 SEz6GsEGMgrAcMpCk5+JTlnH4Tblt/ScZFtN5mub7dq2L3ergVzJR/1X3SDHnsp/sm7YkiYRjxX
 RsaMPad46VlC7fADepU85gDWsKEyYE8FXv/flnOFiS0Z9D+xLWhFZwlcTIDIOcV23uNI7Huphy9
 l+5sEVYcjP9o5lLmKrz6JVGE+8/p78JA0QvpsukT/jvfRYp+YZuREBY1EhFb3vuIFz0afps12Ua
 GvOJ+XDuEbiYS1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6AcSehRpw1Oe
 O4NUxj78fBTFlC4lGWWiFUagHkgUkTY7wYE5AOzV7/tkXZlaD0dCDPmnguhmWjO78x1KUGzVbqo
 UYtC61ZHkvaeYJyyv2RXmU5A9/eEDqX5/JyUj5VlOQ1enW7vS11x1hmpyVeZTD5jbYj2LJ9I2vW
 MRa6DRuGcgJnqZ4kULoN2Ki9bNTmC+tC/IyWc3uc2LfX27LKjKhRcLDyixWMTWqcHhofz6VAVzu
 JtxsHw8Qj5rABh9GtKV8tWFRsI7pv1yDPLJeh7zWF55hHoDQi9nt3x7FuXlrV9VdiKp7z2Yo+s0
 odn8gz1ZOQ1HOpqZ0bZ2CubJiry1bwoFW9/gj2Cp6fXl/9wpshYREbIbmb3Jwqa1cVWhlnFgH6A
 W/EYc6qf8iJkxqmg0p2dkTOJiMiTpSoLZJokfU6aQsKRbzpK38k9KETgcWMTr0+99o4ao0GdUzk
 xsbIgzqC9UTItzVSWjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX/qBi+VBF2agW
 bOaVmvxMdNXmIf++wpUDETTd/OmQ+RQAnjAoh8G40OtEjqZbgrH/Lg/4nBa9jobEAPGICrI1het
 2WHU0rlOZh2suY4r+d3ZThC3o3SzGwU=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f754b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YZ50TJWjaUZAoJxcgJCEXI_ydM2EnOxv
X-Proofpoint-ORIG-GUID: YZ50TJWjaUZAoJxcgJCEXI_ydM2EnOxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3

