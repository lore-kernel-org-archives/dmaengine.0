Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977324;
	b=rIdhHA5wWDDxIdHysv6YsypFXkU+QmR/LHdc7ZnQc3nVe48Xmi72/mzMRI3rfPlmQPSx
	 ZzxvKtX93xFJz5QfmxrvFO4zl9vbmNi6GdVH4lfcEsEFXUN9VxgfqSjl0qfHMslOwDyJm
	 XDM2oZJCYnRnRQamsWF02HwCVJNXr8iSzO5zB3o6cpVixySe8iNOHAX/vEOfxVfGWAfnR
	 2wwBVNDPhf5s+Y5YMP5jAIaKSsGKr4p5EP9Udb9qvjHrAkmR/F9g/eOHPw72a2v9617Jz
	 2u1fMAM/g9X01qCKSVNUfW8pvI0g6h3dpcRaOdsafOFvk7Cu0aJFaMsdWTB7TB+0TLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HlociWaNDzzeC8BLa8/D5GL8aGJf60PlW6/5yMs6E8s=;
	b=L5G3XAb093sLfIKD36T6XbRUtqq7ZsHtG1TbfrLH5guNEomvb+t/14UZ4qp2nokVODcI
	 UBiBC8P8tprys93EZekZPc3UQjJuBk1F/wHpLlvTasvjruPFkO4kSldUpJZXg87mPHlED
	 1ja0vfZuZofwlYDLD9dp6+F8h+M6M+ksDRlj2KLbkQkn1PxkeCMOSGSlDqp1gnyY77Vy/
	 qklgq+e0SmhSKYCHbg4PNIPiy62hiZh5v4E81UGqColV8nBU59VYLAHOsQCFOnSfp6UuU
	 5NIggtScNMo8xl7W1kDtYYxwvaOI2Jn1E+US0rvgPS1iNWjUXVzDn/Ii/kErXZiMuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iZ/UQQAe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QikNxEFD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED0606A332
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CED0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iZ/UQQAe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QikNxEFD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExpUD1038743
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HlociWaNDzzeC8BLa8/D5GL8aGJf60PlW6/5yMs6E8s=; b=iZ/UQQAeqrHkG5vL
	lNrYWvcY90y67fqv57165Xs47wsGnng1jcRRb7gM4WnmBgo4WI02fP0s0fhd5npO
	PVCGclDEss6jd8b54NGD0Oee1DKlJghR2NcpybQJxq2/o1nCNcbw0XzyF+W80r8W
	/Cg0FPzBJ9rbdGb/P81mjY1HS9xZ9Z/4JXsiEyA0anRatyDiJ+EyM+E7DNi7T6iJ
	UO8HBrJLsgRFUDjXWL66aWJNviHQcuxVl831KNGrb63e/EwLESZ/rJGg5Ph6b46f
	VXdU1VFPr04RQgy8jWsDY2qun3NfaMgi/REjdTQSZRXUO9KeGtMQDZJtOVjm6OAm
	7jZGXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uana-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:02:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so672714a91.0
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977322; x=1794582122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlociWaNDzzeC8BLa8/D5GL8aGJf60PlW6/5yMs6E8s=;
        b=QikNxEFDlBrZSxOk48YpOfRotKf4itP1CkuYBWcFCTgOYYubYBD9ll5y9LvVZt1rr5
         TMS1KWYZwHvLN/LnOvKmMYF7k4lTa/zZM9LChLL9F2Bv+GkYKvfUErEYlZ+S1a/AxtkN
         FD2Yw+QtHsUu4qDmZtGSA5O8nkf9cL74F+xkpShkJ7bppwgtKWYqyMt3oWoGe1NK5v/g
         8G3FeEE4KhzZPJgherav0noh3KQTXoe1hyfhgIABh1VAuKJQfFO1qP/zuu3GDikAXXNU
         jOHrvQdE5bTgXVKHe1Jj2o+Q3b18J9nAsSMZOkOX10uxwYJ1n0Tdzl3pnTJDxoJGGUJs
         n82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977322; x=1794582122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlociWaNDzzeC8BLa8/D5GL8aGJf60PlW6/5yMs6E8s=;
        b=Xk8ZcPDY2CTPFCUUUyCduOqFJqfdFOPGUF0vpQWqmOPmOl24IYsFMeyYGWBPcMovMM
         eiC7beehhgMBGRNIoojElDr4KDkiYD+Ium9x3+swNHfOacrtuHO1tzetBwsCfoqXFsTo
         BuC06BM5TaWLEZvSOIvVSBwAX84qwwlHJVbvlibQLhM2cRqJ6cMmNRNFhZClzsSlev/o
         rTbFqYK6KFQCxuqaXyOzfK/+Qfrss8HTaEeY0X4fdLZOA2dcWN0kxmmIvGrraJsAGif/
         SzBIqf7TUAWfHj9SbGSa8n9deaBP1k9mPC4ZBH8IxM8xgqkdgHFLMfaNSUQM9U6XSOcr
         UVqw==
X-Forwarded-Encrypted: i=1; AL+hErFLwHkcN6LggJ4/JHMjYgdBpTzpnUDbv+kJr66GJadISbApsD7BHBcs0O2pWSVl8zf08WoZs3ZuAlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kYZuGOetFTo+R9/A7Y/5JDJEju93kvn9afoEbpueIf2VTL+UX
	+matclCX2UTGFiYr/jd89+zWJx0hePT8Y6z+zomYHYSLkty8/T7m+w1izqHCQ9A1NcjKcq40fVb
	acb77SCU9s60F36o5qMJMW5gkyBt5RJ7Q++0+iFouiqCuiLRqMG+JWd2ZAWndQ4w=
X-Gm-Gg: AYBFou35AcJjEP0JTu0gY8uJArvaXKjLiQUAVz4hGr6aaxcaY3B/N+YtbFwrN+ijqgO
	lzH/+DAkY61zq6HLi9SNa6zJ0RIkjF1uCzh3xc+mi3mth5R09Leh5yXV185V2lUq8FLu9/lBqF1
	GsPLTEQqB8NvRHMVRYbQHUwXNxJ5KCSMd67KPOczfJ2GGBIJ7jrD8i1qJPsjFBGW9Zp0AaI87BS
	IlPZAxVcT4gZ7y6zB7bYmS9EuDF5Wrc5XoRgJjlNQEdm/Y1FtbEgivKnUZWh6DhKcqosowmAlUs
	nSJoTifnzonUSO4dUTJhhHwDcWiiODhVdpYNtTtIVGzxVqn72ON0VH96YMNZxQHKgRVRg4rS575
	o9xeF8bQxca7ciJdJEJT5Q6RMYqmn8qyR3n3FJl8pfFZII54t8xcOfYeKg41mr3ahzxVYwKI1bw
	v0VgG8WJEf
X-Received: by 2002:a17:90b:4d01:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b0db69f38emr2998866a91.11.1793977321315;
        Fri, 06 Nov 2026 07:02:01 -0800 (PST)
X-Received: by 2002:a17:90b:4d01:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b0db69f38emr2998788a91.11.1793977320530;
        Fri, 06 Nov 2026 07:02:00 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:00 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:19 +0530
Subject: [PATCH 1/6] spi: spi-geni-qcom: Add transfer_one_message() support
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-qspi_upstream_series-v1-1-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=12551;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=GV6mYXrRMN5D8EbEOyheV6OV01uzAGb3j2KVOI1zyIQ=;
 b=Fj+gonexSzqVJ9IL7LNr1HyRd9I4OF2t8Hus+y9IVeK7lWWQadN+oc67sTquHxnoJvKgsY7Cn
 cMAqXkHBSrdDpuK8tNb4nnwzmsyrBpeuP6MOkBR+Uapx+boTvEFykEm
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/oQ7gqBWuk/5
 8qM3zNQvWkQtel0V0KRz1QaolaE7nnwQhXaZft508ekl4RRR6tTtKhvm0BpTh7xEikE5HxgX7rg
 /BEAlqZAwbuuKj6ZQslEEiNKP0Ep4Bw=
X-Proofpoint-GUID: Fp14NDUNJExVASWvqFHQk3HrbEBJ5BMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX6mqnbrplFf4h
 Guv3XtP10cLsOR7EW4paViJ2RXlROQOjOhRn6m6PGFqRkMknQFxUVa/EK33pnimrYVqTZknErgd
 5Ir/RtsPF/IcSsapmtDxNDridDhvJuMNq/U5xFrqQI80ak0Yi10e55dOEJVYisqdsZahSjn8n7t
 JkoONY8famKD/RXkJ6FBHE68bjrFYgL7n7S/gmPLIB7FfU8kVkIkYs08QTnSLydV8kYTqAnmUBY
 iWKS+EXbUzHdEhU6xiH8VJl0oUzfNClx3Oxvau8RNlhg658pAEw+T2QCpdtYMJGXctlxB0hKBkB
 U1EFZHIT+WPSKqBwUbskZs8YkeJzjIGMM4dvaa+nyr58bSaS3nOL/WHhFvIzbkwIQekpbAJBW/K
 bgSiIqcTq/AkKcnB4VFFm3JbQdDhF++I6lIFeBaMHhq/tBrh553rLq5opx5rlmbX8l/XFsHsUWk
 6NHJ8NykedF2Of2XqHA==
X-Proofpoint-ORIG-GUID: Fp14NDUNJExVASWvqFHQk3HrbEBJ5BMw
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedebea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JThQf_oUxqckihrRH7AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

The GENI SPI driver currently relies on the SPI core's default
transfer_one_message() implementation. Adding Quad SPI (QSPI) support
requires driver-managed message sequencing. In particular, GENI QSPI
reads require combining a command/address TX phase and an RX data
phase into a single hardware command.

Add a driver-specific transfer_one_message() implementation, retaining
spi_geni_transfer_one() as an internal helper for programming individual
transfers. Handle completion, transfer delays, errors and DMA buffer
synchronization at the message level.

The custom message handler must also provide the GPIO chip-select
sequencing and delays previously handled by the SPI core. Track the
selected GPIO and its timing and polarity for device switching.
Invalidate the cached selection during setup and preserve the software
inactive delay for native chip-selects.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 247 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 224 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6c57f8309a3b..25c03096ee23 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -6,6 +6,7 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/qcom_geni_spi.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -13,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
@@ -106,10 +108,14 @@ struct spi_geni_master {
 	struct completion abort_done;
 	struct completion tx_reset_done;
 	struct completion rx_reset_done;
+	struct completion xfer_done;
 	unsigned int oversampling;
 	spinlock_t lock;
 	int irq;
-	bool cs_flag;
+	struct gpio_desc *cs_gpiod;
+	struct spi_delay cs_hold;
+	struct spi_delay cs_inactive;
+	bool cs_inactive_level;
 	bool abort_failed;
 	struct dma_chan *tx;
 	struct dma_chan *rx;
@@ -400,23 +406,23 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 	struct spi_controller *spi = cb;
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	spi->cur_msg->status = -EIO;
+	/*
+	 * Record only failures. msg->status is finalized when the
+	 * entire SPI message completes.
+	 */
 	if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(&spi->dev, "DMA txn failed: %d\n", result->result);
 		trace_geni_se_regs(&mas->se);
-		spi_finalize_current_transfer(spi);
-		return;
-	}
-
-	if (!result->residue) {
-		spi->cur_msg->status = 0;
+		spi->cur_msg->status = -EIO;
+	} else if (!result->residue) {
 		dev_dbg(&spi->dev, "DMA txn completed\n");
 	} else {
 		dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
 		trace_geni_se_regs(&mas->se);
+		spi->cur_msg->status = -EIO;
 	}
 
-	spi_finalize_current_transfer(spi);
+	complete(&mas->xfer_done);
 }
 
 static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas,
@@ -511,7 +517,7 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
 		dma_async_issue_pending(mas->rx);
 
 	dma_async_issue_pending(mas->tx);
-	return 1;
+	return 0;
 }
 
 static u32 get_xfer_len_in_words(struct spi_transfer *xfer,
@@ -926,7 +932,6 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 				 struct spi_transfer *xfer)
 {
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
 
 	if (spi_geni_is_abort_still_pending(mas))
 		return -EBUSY;
@@ -935,16 +940,206 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (!xfer->len)
 		return 0;
 
-	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
-		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
-		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
-			ret = 1;
-		return ret;
-	}
+	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA)
+		return setup_se_xfer(xfer, mas, slv->mode, spi);
+
 	return setup_gsi_xfer(xfer, mas, slv, spi);
 }
 
+static int spi_geni_setup(struct spi_device *slv)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(slv->controller);
+
+	/* The core deasserts CS after setup, possibly with a new polarity. */
+	if (!(slv->mode & SPI_NO_CS) && mas->cs_gpiod == spi_get_csgpiod(slv, 0))
+		mas->cs_gpiod = NULL;
+
+	return 0;
+}
+
+static void spi_geni_set_cs(struct spi_device *spi_slv, bool enable)
+{
+	struct gpio_desc *cs_gpiod = spi_get_csgpiod(spi_slv, 0);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi_slv->controller);
+	bool level = true;
+
+	if (spi_slv->mode & SPI_NO_CS)
+		cs_gpiod = NULL;
+
+	/* Release a previously selected GPIO before switching devices. */
+	if (mas->cs_gpiod && (!enable || mas->cs_gpiod != cs_gpiod)) {
+		spi_delay_exec(&mas->cs_hold, NULL);
+		gpiod_set_value_cansleep(mas->cs_gpiod, mas->cs_inactive_level);
+		spi_delay_exec(&mas->cs_inactive, NULL);
+		mas->cs_gpiod = NULL;
+	}
+
+	/* Preserve the software inactive delay for hardware-controlled CS. */
+	if (!cs_gpiod && !enable && !(spi_slv->mode & SPI_NO_CS))
+		spi_delay_exec(&spi_slv->cs_inactive, NULL);
+
+	if (!enable || !cs_gpiod || mas->cs_gpiod == cs_gpiod)
+		return;
+
+	/* DT polarity is handled by gpiolib; ACPI uses SPI_CS_HIGH. */
+	if (is_acpi_device_node(dev_fwnode(&spi_slv->dev)) &&
+	    !(spi_slv->mode & SPI_CS_HIGH))
+		level = false;
+
+	gpiod_set_value_cansleep(cs_gpiod, level);
+	spi_delay_exec(&spi_slv->cs_setup, NULL);
+
+	/* GPIOs belong to the controller; do not retain a spi_device pointer. */
+	mas->cs_gpiod = cs_gpiod;
+	mas->cs_hold = spi_slv->cs_hold;
+	mas->cs_inactive = spi_slv->cs_inactive;
+	mas->cs_inactive_level = !level;
+}
+
+static void spi_geni_dma_sync(struct spi_controller *spi,
+			      struct spi_transfer *xfer, bool for_device)
+{
+	/* The core maps buffers with DMA_ATTR_SKIP_CPU_SYNC. */
+	if (for_device) {
+		if (xfer->tx_sg_mapped)
+			dma_sync_sgtable_for_device(spi->cur_tx_dma_dev,
+						    &xfer->tx_sg, DMA_TO_DEVICE);
+		if (xfer->rx_sg_mapped)
+			dma_sync_sgtable_for_device(spi->cur_rx_dma_dev,
+						    &xfer->rx_sg, DMA_FROM_DEVICE);
+	} else {
+		if (xfer->rx_sg_mapped)
+			dma_sync_sgtable_for_cpu(spi->cur_rx_dma_dev,
+						 &xfer->rx_sg, DMA_FROM_DEVICE);
+		if (xfer->tx_sg_mapped)
+			dma_sync_sgtable_for_cpu(spi->cur_tx_dma_dev,
+						 &xfer->tx_sg, DMA_TO_DEVICE);
+	}
+}
+
+static int spi_geni_wait_for_xfer(struct spi_controller *spi,
+				  const struct spi_transfer *xfer)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	u64 bits, ms;
+
+	if (spi_controller_is_target(spi)) {
+		/* A target cannot predict when its peer will supply clocks. */
+		if (wait_for_completion_interruptible(&mas->xfer_done)) {
+			dev_dbg(mas->dev, "SPI transfer interrupted\n");
+			return -EINTR;
+		}
+		return 0;
+	}
+
+	bits = (u64)xfer->len * BITS_PER_BYTE;
+	ms = div_u64(bits * MSEC_PER_SEC, xfer->speed_hz ?: 100000);
+	ms = min_t(u64, ms * 2 + 200, UINT_MAX);
+
+	if (!wait_for_completion_timeout(&mas->xfer_done, msecs_to_jiffies(ms))) {
+		dev_err(mas->dev, "Transfer timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int spi_geni_transfer_one_message(struct spi_controller *spi,
+					 struct spi_message *msg)
+{
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	struct spi_device *spi_slv = msg->spi;
+	struct spi_transfer *xfer, *next_xfer;
+	bool keep_cs = false;
+	bool dma_synced = false;
+	bool started = false;
+	int ret = 0;
+
+	xfer = list_first_entry(&msg->transfers, struct spi_transfer, transfer_list);
+	spi_geni_set_cs(spi_slv, !xfer->cs_off);
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		if ((xfer->tx_buf || xfer->rx_buf) && xfer->len) {
+			reinit_completion(&mas->xfer_done);
+
+			/* Synchronize buffers only for DMA; the SE FIFO path uses CPU access. */
+			dma_synced = mas->cur_xfer_mode == GENI_GPI_DMA ||
+				     ((xfer->tx_sg.nents || xfer->rx_sg.nents) &&
+				      xfer->tx_sg.nents <= 1 && xfer->rx_sg.nents <= 1);
+			if (dma_synced)
+				spi_geni_dma_sync(spi, xfer, true);
+
+			ret = spi_geni_transfer_one(spi, spi_slv, xfer);
+			if (ret < 0) {
+				dev_err(mas->dev, "Transfer failed: %d\n", ret);
+				goto out_err;
+			}
+			started = true;
+
+			ret = spi_geni_wait_for_xfer(spi, xfer);
+			if (ret)
+				goto out_err;
+
+			/* DMA errors and target aborts are reported through msg->status. */
+			if (msg->status != -EINPROGRESS) {
+				ret = msg->status;
+				goto out_err;
+			}
+			if (dma_synced) {
+				spi_geni_dma_sync(spi, xfer, false);
+				dma_synced = false;
+			}
+		} else if (xfer->len) {
+			dev_err(&spi_slv->dev,
+				"Bufferless transfer has length %u\n", xfer->len);
+			ret = -EINVAL;
+			goto out_err;
+		}
+
+		msg->actual_length += xfer->len;
+		ret = spi_transfer_delay_exec(xfer);
+		if (ret)
+			goto out_err;
+
+		next_xfer = list_is_last(&xfer->transfer_list, &msg->transfers) ?
+			    NULL : list_next_entry(xfer, transfer_list);
+		if (!next_xfer) {
+			keep_cs = xfer->cs_change;
+		} else if (xfer->cs_change) {
+			if (!xfer->cs_off)
+				spi_geni_set_cs(spi_slv, false);
+
+			spi_transfer_cs_change_delay_exec(msg, xfer);
+
+			if (!next_xfer->cs_off)
+				spi_geni_set_cs(spi_slv, true);
+		} else if (xfer->cs_off != next_xfer->cs_off) {
+			spi_geni_set_cs(spi_slv, xfer->cs_off);
+		}
+	}
+
+out_err:
+	if (!ret && msg->status != -EINPROGRESS)
+		ret = msg->status;
+
+	if (ret && started)
+		spi_geni_handle_err(spi, msg);
+
+	/* Return buffer ownership only after DMA has completed or been stopped. */
+	if (dma_synced)
+		spi_geni_dma_sync(spi, xfer, false);
+
+	if (ret || !keep_cs)
+		spi_geni_set_cs(spi_slv, false);
+
+	if (msg->status == -EINPROGRESS)
+		msg->status = ret;
+
+	spi_finalize_current_message(spi);
+
+	return ret;
+}
+
 static irqreturn_t geni_spi_isr(int irq, void *data)
 {
 	struct spi_controller *spi = data;
@@ -979,8 +1174,6 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 		if (m_irq & M_CMD_DONE_EN) {
 			if (mas->cur_xfer) {
-				spi_finalize_current_transfer(spi);
-				mas->cur_xfer = NULL;
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1005,6 +1198,9 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 						mas->rx_rem_bytes, mas->cur_bits_per_word);
 					trace_geni_se_regs(se);
 				}
+
+				complete(&mas->xfer_done);
+				mas->cur_xfer = NULL;
 			} else {
 				complete(&mas->cs_done);
 			}
@@ -1025,7 +1221,7 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (dma_rx_status & RX_RESET_DONE)
 			complete(&mas->rx_reset_done);
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
-			spi_finalize_current_transfer(spi);
+			complete(&mas->xfer_done);
 			mas->cur_xfer = NULL;
 		}
 	}
@@ -1057,11 +1253,14 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 static int spi_geni_target_abort(struct spi_controller *spi)
 {
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+
 	if (!spi->cur_msg)
 		return 0;
 
+	spi->cur_msg->status = -ECANCELED;
 	handle_se_timeout(spi);
-	spi_finalize_current_transfer(spi);
+	complete(&mas->xfer_done);
 
 	return 0;
 }
@@ -1116,8 +1315,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spi->num_chipselect = 4;
 	spi->max_speed_hz = 50000000;
 	spi->max_dma_len = 0xffff0; /* 24 bits for tx/rx dma length */
+	spi->setup = spi_geni_setup;
 	spi->prepare_message = spi_geni_prepare_message;
-	spi->transfer_one = spi_geni_transfer_one;
+	spi->transfer_one_message = spi_geni_transfer_one_message;
 	spi->can_dma = geni_can_dma;
 	spi->dma_map_dev = dev->parent;
 	spi->auto_runtime_pm = true;
@@ -1129,6 +1329,7 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->abort_done);
 	init_completion(&mas->tx_reset_done);
 	init_completion(&mas->rx_reset_done);
+	init_completion(&mas->xfer_done);
 	spin_lock_init(&mas->lock);
 
 	if (spi->target)

-- 
2.34.1

