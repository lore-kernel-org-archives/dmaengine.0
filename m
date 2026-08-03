Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1735D4028C4
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756452; cv=none; b=STyXy6jR1H3XvIpF90EvqrAhm6jpiisnmhX20YHma+sr+sgQxNjW7kPvBq+hjEA6SSXwk1UZqbXUtrJMjdrJw5VuaMHvju5Wymfw9TfeNV7vNu81tkwp1hhUsk9mVaj9RWOpi+GgR+NPgWlskyDVUVZGK+ozqEJ9ZOcyaOW4+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756452; c=relaxed/simple;
	bh=MpQ3RqfdD8RbKrgC+8eU6ZklRlgT3OcMBsr6ljHxb9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+c46pD2FHjWX74Gf8/7nLwOJi2k7gt3Y8iBhihedcAP0kSrCFzgcTrAsUx5nD36u5MbtGDsrTnaOvwj6CiC7Vsr/P2oX7ztSJzXaJtVPLj/bifDjC/UZxDvgNYbuCiqPpD7kADj6fbA5dxC5+4X61ZI8tIwSmtquVwCrS0Hz7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oE7DA2VA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8/Injyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oE7DA2VA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8/Injyx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673B1PY53759015
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 11:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qo5B/ZyPp57hJoXVEoU6RtV8yA5IEg/ctFOq7PMVsVc=; b=oE7DA2VAReO88w7B
	RX2xSQ1+P39cmRJW2HV/5vgJNoSASoBJtYCSQ+Rx9148Ysgy29GnYgHe/KzARUQH
	tKq+nbVOfScsF+9WKN6K9AQ6/haYZ/dpyPuVlTjZ1ThP7M4x2SiTWscPmDis1QAZ
	9bnxA1x1mlHhfNxDrAY+VlbYKdJtL1TnNGzhTUapVdzzxN2K6rfS1jlFbSUTHG/h
	XWSACZftHFw+D1PPvouElBgsHL1R7v+Sy3xakPgbrFxQfM1/y9FRhFmzf/o2d7a3
	3RwZLQJb/XxMLACVomp/Ev6Chqbhks9Lj3RVBf5okpvGEJwmpOGm3L1v97wPRTJy
	vsQxvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns8fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 11:27:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so2963795a12.0
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756450; x=1786361250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qo5B/ZyPp57hJoXVEoU6RtV8yA5IEg/ctFOq7PMVsVc=;
        b=H8/InjyxAVFf5KlINktIow0dbav8KefqD/jQfNF3dJUHXn9aWJqKVBQd4L6YegF7VA
         5CBCI6Yk+sp7+P3lcwAOdBZklki1sStA2pVBel/w3qYrpUghKkPhepFIRHrszQe8y+C5
         FmS7+5hRm+WDfcN+K51R60eMm9iUF5qgZDu4JpqfhX1BrDjMlRNnsATObku2D07ZY2BN
         dbOSDV944V/nXQ6DyRGS4Gdt/kCwSH1RIPLTlZ3SmcbEifLQ+chlHCd7tuxO5N2iJpmp
         6wBQrFwx1H1CN6yIj9t/GeN6GnxkwJ19KjK9eh0b2QHupnSZnZ/mCyhn4YMR0cGIyxmr
         LWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756450; x=1786361250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qo5B/ZyPp57hJoXVEoU6RtV8yA5IEg/ctFOq7PMVsVc=;
        b=AVRVFNjw11q+L2qkzsC7+9eeR9SAa3sSp10MKfn7eauc2oq3vZ0pd8LY4JW+8Wg6cc
         DfSmxARuRG14tPVmnVDxxdCf1UsaQaOumri7t4q75rmDREsq+7AJjYMpk9YME2kUe9up
         o/hu4sXjtFtBqJyZAxofeatISL8CK9fiJz1LGqecbmZiBm5CbiB+veqKrGvDwSmfDzfu
         uLjMbmZIZXYbu+z0yycKd4aq4AGpasO+6lP+r2lCLwY4zmXPrwADcrwT9PRS9CdYM0zf
         S7Ud94rq+toMywj5NW91Lyh6ByVY/JAtwM6TG2HIm5y+vvV44fcMuGifledNq6xc+Vqw
         sQnw==
X-Forwarded-Encrypted: i=1; AHgh+RrXsLBWNpoBJfXN3gi3x0xEoV2d13qF2LAJVCv2o7NUD95VPrK5gRZRoTo9vAZ/NJAsnzf1EIcRF8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CRw1eGFKwIQiHeJ9bCbXkNLquidWMrY0TA1eHcuCRkZ5dfmg
	5yBIR3idNnsksgJ+Y+ygxibr5sPNb6WG6FTxnwEYZy19KYhIQlE2IltmzNG4vUQvY4fLgRkZHx9
	VCa3JX16gJyEYv6y6u4GsuwR5dnv9knX17i5jAK7IdwtxJ6nOfm+57SsikOVhoek=
X-Gm-Gg: AR+sD11GSiaxbYnsV7KMhIuHgh/7s9v9QQObDHHyOZRevlprGmJ+tMLpa8Et/GmL12v
	P3XuH1SE31NjLF8qBMxfoHt1bm1xAnD4X8CwpowU2HWl70rLWrM/xefWWH/BFZDHstyqWlrTvgY
	LX2J62CEXee5YfUYcmqL5A0LwgpYMxTyh6VCUZQ52dqlFuOLdVe0bwzecHjcKf/5N6Ml0EMWov7
	h32FG24IdpCGLDLSmSJvWVw4jEIPZOAoL49VYI07zUuq02RXzoKLGBqdmTZLpdGLTuhrHrWrWWU
	QppRMipS7cwSTZCKB9qejZJSB9VJP4CktGN7v9pzUBIMNGmA5pXa25qwEcT81Z7r5idYDvQGBv5
	wmYK/dOlm3RzJ/es=
X-Received: by 2002:a17:90b:520d:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38fb2409b7dmr11377667a91.3.1785756449582;
        Mon, 03 Aug 2026 04:27:29 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38fb2409b7dmr11377634a91.3.1785756449108;
        Mon, 03 Aug 2026 04:27:29 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:28 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:36 +0530
Subject: [PATCH RESEND v7 07/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-shikra-dt-m1-v7-7-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=6381;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dAQg2Aq4UZ5Zzn+ZshBkBCEgEHGs1OE4W0xXmo9svNs=;
 b=BWbYRO/B0g+6exLrwT/lgL0n4/d8DuGgM/+HelqraY7Xky/8cbA277o4qR09T4ger11j3Dkf7
 ampW1Sva1e2C2MX+sTTtlV9ZTu9mSKYH4q4OhXKPfzyX/w2bujwvQe6
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX8DXcYL7TTaDg
 8OZE+/3tdqxPfCAy1NZXPj+PHW68ckXWoEPX3afz5HEjltyYYetnaSw5XD+W+9pN2hthDfTz9Ek
 +1AUwep53IrEfqMC2+hUK4RhPyotrgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX0rLaj7LT65SW
 6aJH+YS6AX9cZ+0q+QHJOoEzuN+7gMmFlBz/GDJ4ln39nRjJrXaUUj5/viqT+3eQmbauL/Ag+tf
 3rqpMD5d+iwrww/gUvJrvRjhsQFp0+5XUlFEbpKmLjfagEgoqUekfEaV9+6zZMMt5DpaUGFAWPI
 8gp77KtwRMrNJ7YJbtszGT/m8GMAunrHg95cgc9CsR5X+qOioj0T8mNsKMg/g96ww6Nj+CgtE/g
 T7P557sCg5Xb1hFjj9hiN495fK/PZ16nBUuhb7FmSE3TuhlGmxjSTDMIJhvxukrC3xodFGE74LY
 RBU0lwQIN5RrSPFiIPQjsC5Vq/XpnvIHo4r1QmpFL3wkvafj5UW3pBEjY1N8nV27s6NkoG2zMBW
 Lun0HDUVE214fdFdubtvQM+Apilu+eoEJBTHKkDpF3wjYvrxb7ospBIynJ4JHJDk+JZbYBNgy3O
 RCDHbEw7BgX0Gs05HUg==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a707b22 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fn5bFolYHyDWY0CUw3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _HClxBGyWxIKdWNz2SwUAV70TPTkmXZJ
X-Proofpoint-ORIG-GUID: _HClxBGyWxIKdWNz2SwUAV70TPTkmXZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030102

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 570505c927bb..fb0391bef460 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -998,6 +999,18 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,shikra-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <14>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -2195,6 +2208,260 @@ cpufreq_hw: cpufreq@fd91000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu00-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu01-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu10-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu11-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsp-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu02-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1

