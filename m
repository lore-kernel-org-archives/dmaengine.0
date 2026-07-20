Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1203ACA73
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544635; cv=none; b=t4fz5d78snoAMH45QuQ23e5966JtW3Pe2cZdXjtDaI2Mkcm39dF/tldHrDaxeom9qA9BjgWKHIqD8RWAdYeeVdBAPw4EzMjiKyCJaywKGwrWTn8dH8kiHH3QEhXeySvfNRfDGiAsCjUuqzgevZS073tyCwRRYXK/Y9Ml2PlsjJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544635; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RX17J3dcll2TAuPMFVKzUUpD06l8FLoik+FA+qNP+dkZr711/uastFuyR/3xqredPI4rmCN9gGHqQp8eYIUDO0xdP8+Vcs/GFMUayc7/IcrUBjZfw8wvQi84tC+ZW/zEzhbDDdtBkA4IMR5L2TQSt8LrAfgW6hCo7AbCJVly0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1257ozP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBEsLkWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1257ozP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBEsLkWc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9w4oC2189483
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=L1257ozPH0mfcfcb
	i2O+W2nNr5Hhx4iKoJfYtg3iYZ7JzWfpY5BAxole7OuY9s1nn0ae7lvHD0tuPYrr
	wG8huGQ/Bghw28HszxwRTg80mqOH+gjT3MipdzJQ0NIOPEYV97p9TmlJIjjbBP0n
	QNWwcKwjEuuP0ObCGJEObGXG2YLV0hmktC9xSwoRN/qOED2zT2ochr2bDNnqVlHn
	AHBfG7oTdJPBrwrP2K8GF27MODHIRa1zec3MS6LxbOH2ZpFQC4EVv0BVRaxpstX3
	brmhEjFzeJ7RghMHLXP6kAbArSDYkD9dyq8UWSULBlp0GghibohuvexHSC9e1e+n
	TXgrOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vthe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso7015477a91.2
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544628; x=1785149428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=RBEsLkWcR07so4HttWIcTjBRFClGTeziBJrWo9ppo0iiookIyVgsF+d9aSGovwRMGW
         ub0BZTAmE78MnEb7pZP+e/MK4jQ6XitTLPEnifaCpjMZOjAXObAd4R6p4M2aWgxjpm17
         dzslZAhJozEskRtaCw4J0GIKbVc4xGmOYa/w4/K1rVnwDQEJrS3aNpRJ4y7JFSpMwq67
         rA8qjSts/5o3TFy9uAaYqcNgOgETQyMq/MFp3/kxseIjY4pDnNcWxwL/sJVUbUm9mYdj
         Y7A8eYwdaEO5SnnewYUBJkepOKPhF1ZVp5BRWYLjId6tpY5c7Xdv4HKapC4F/RuZegN9
         Vb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544628; x=1785149428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=obowEDCtSUdRhoJqosIeXQ7TRIHHfSBlSZiXbSncQP+JhAqbqzKDWKKMSoL1L67co7
         vtB21v0y+T/eAcSzuS0KI+l9nF4SYY5hDZT1KweFGZbR9WIZ7YRdZkeOh86wMhyjVmwG
         ENNvQPqXgevE+CKEKq6EMucv4SE1vJ/J89JlZRFSOKaXHsZ2YEKChaRw45W3VLQxBUi7
         2geZJmlMtXW5iENIcGOmc/dev4VsYoPkuWgzWXL2ZZqn7UkUodahsAZP7F5Mi+ZDQOLu
         Z2Iads/bvvVYTTijE3TtDUagFybEThCLa2mr31eQ0pZpMOlNBzw9MQUsNurSfW3bGcHz
         y51g==
X-Forwarded-Encrypted: i=1; AHgh+Rqlair9OElaYYaQtYpbCRrhX0EHfef6FMSHGFJdcKwMY93kJjnALmOM6Eb1dPIFWUZFRa8VgCdp1co=@vger.kernel.org
X-Gm-Message-State: AOJu0YynOJbMK9RimXJfIlrXsCOK9sctA9UdBJWTOrlKUM6+i+hBMVWw
	yAqkujKQcb+VZcaM98dJ6tJv2qWTpqumn6WMBc0w57oR0iLwtghkXGPpmzOKefLsgvnN4y7J+Zc
	1h7IKaY9KT1aAiSLTv0D+jPyUNHGRmG3ypMHel/kiDdX2tHFitsjO6/D4/6pxp3c=
X-Gm-Gg: AfdE7clPuVd8wa4e3qp0xZdVkt4IphiP4iar+yRacJuatmM6JvVoWueGo/TJLjsVbaO
	1CMgU/YHSR3kHJEdYlTJMf3X+ibnF+0+pHjWMsEnOTzZVUcxFk7eztHkuqoCTc3oss1EzQA8G1Z
	5gsF3NvkYD5H76uDhkH1STh9+Q4c/hndSMN2iQDB4TYbnqrxZjmeRPFQjt25nF1h33SA7eh74Dp
	Js/IAmP1arAnGzIAdFcRkzPj84U9o2L6f6X1l4cAgbuFgAzUlElqowwtw/FsifTScWrxf8e7xAT
	CJuxOETG8/ig4cL7IKEyRD6Q2eeBxMyRrlC6xpBZtTWSCqSoPgXYO/zBvfFWZRPPA//GUaSYQX1
	LxISbxB8qMcxH/eM=
X-Received: by 2002:a05:6a21:6b17:b0:3bf:c12c:2ecf with SMTP id adf61e73a8af0-3c3ada993b2mr12765719637.59.1784544628371;
        Mon, 20 Jul 2026 03:50:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3bf:c12c:2ecf with SMTP id adf61e73a8af0-3c3ada993b2mr12765676637.59.1784544627938;
        Mon, 20 Jul 2026 03:50:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:27 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:18 +0530
Subject: [PATCH v7 02/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-2-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=Q9H9pLf/05l54JnlLMphYehPBHYQCGivmk44SyaH7YIRKDjrxdBXLR1Al3xgZb3WlEVZ/10Uc
 cHaaOTz/bOkBz0aOVyTfncgciS3E1/+1NFxBwX3khoGWz47Wj9hXDIY
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dfd75 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX4VVAtIU+Q26x
 EaP7FLUb4g0EsK5g94zEt1uVzg/XQYsgDKdiOpKPHLW9WTHwSCk8Xqi5J7qybStesdKGbL6Ubhp
 9jgZ0Q8B+wbNmP8oIcl/eLrv/Lqpg8Hg+EfkbayND49tO3+GERrx0IF5S3Q+QQwZHhNx9TgeKEm
 oDxZ2+xKWnWvw9gT6mBh5Cr0rl6eFkEtMzqhmM6hauMr8vOS4o05wThquw86yeNQS7r2ftuKTk8
 bwCjjnC+yG9Ek010hAfwUexlzGj1oGBnSupaMKEDjERTfeYTGzcDBGlmJu0S+5YRkYd+qIrR1bq
 D+sp2MZp/B0xZctL7QjxghUWfyBeHckCiwU6mXNoLlO41lJYYkM/LhvpNFX2V+vjPyOSdtvYvCG
 5dxEn1kM50J8Vu+EZjqvpYJ2/2k6y2NSCF7SFiOkxSf6AzuYnYv4hRLD56cmaL23ii8jWf0S8jW
 q4yWoWNtaABDlcZxj5Q==
X-Proofpoint-ORIG-GUID: qbM7pMSFKcODAnT9WwR3Qpj2T5UkvTA1
X-Proofpoint-GUID: qbM7pMSFKcODAnT9WwR3Qpj2T5UkvTA1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX40Mfz6Atadia
 g2fJrSH6SHqaFMjSjJ1rZLFjVTmJBpjTferSBacUqD2kxcNh67uvj2hytsF83Pom+6/uTZMwuV9
 2ef0PZGbXXwqUwIE1Ehsn3k8vIJBVH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0fb55b9deb9..d66b97dea319 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

