Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC93E5EF7
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544672; cv=none; b=RrihjrVwadsF0ymecUzOAhE6Sa1raq9xtLSGrISfnECN79P2WUeNf4oRqmoJ7Ji8U0LnF69logapvOxFRTergFA4bxM20sSgZSQitx6HxmZ35z5dKlqLHzJ1b1Kt2wKLJ6FsGyEY8AriwvQvH6s7VwZcLWzsBSCJdzVBKBkisoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544672; c=relaxed/simple;
	bh=DTChb5IJt941YLuPwOvT9s6H6kmZ9UZ3rgh//PZhp6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GO+/sND7z7ugFVYeQgnLZtRKYyRzyhAyA1ECpPUbHHdsBp9FbTA9cjGfSa8/xKyg04bpv2ARVbZbWQkIieOFo8Q6fbG5prT2qkzOnxWoMKQKKrTE8y/6Lz8wq+21eVNWkx/jQagU363OpJfJLNWCmvFgVYgIsaND/ef4frGPp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGnE6q+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iP1EAKzB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGnE6q+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iP1EAKzB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vc7k2320726
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=; b=GGnE6q+8yPJ2E3r0
	3K5yEYKGFZ3qCJgTfeOVVJkb0mvCERIPbfzIgEtNcoM10Sb7laudPh2WBRbuh98a
	YVlfReq/J5MOVJ27O2lvjajeVOeLrnAiaYaHXVqUe9yr5MeyfGr6ZEyjLEoWTnIw
	ig4jFCFojenI3o+gi12wqewmpfI9gcjPP+0qfAIRIeCu1g0Droi6W3nBxEOxjD/Y
	xDirkYGL3EXrlUvCPerSrtBT/3gVDiX9/IQSa7ZTqYOCu5lHfOUsSX7WZD+pGpEa
	GG1feX+uhklgFsp83rBNErrw81+fTFHdmEa2UJW9x+u/Y/JArE6O4k85nytNsySD
	w0z5Ow==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kry62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:51:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a651759a2so12350322b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544659; x=1785149459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=iP1EAKzByfZAZgXgHdVXYmqgMahy/a20XvEQeP/57oj116TKCC+BlMuCtAUJA/JZwX
         a1LNdIMA2pw0Ao2B3iAgCgAkqYBhEtiiUCt+Il3PzEjSi1k0gjgtJVkGUUd9NKLW6Qi6
         gf5B5799vL8eJcwyf8MUsztif2Awdoz2yv0t3EolYoRo88i2hOmLMuTeonHmYlnJezOZ
         QeSp6W7szludEYmr5GQ8g+SDz1vs4UGovFoBgMJjOPlrqfVVRpoW5c/e2uPOPZKaMGSw
         2ZAYG4wUduxO7GEqm1ElCHAZ/rpjYHdEtetom0f1vE7vp50zvfVITaS7DglOK0C5S/cz
         AQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544659; x=1785149459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=RSX9RhhL3oK9Nm46nEnTnXxVDb+E5Ub6xhRQphcwHYfaliICpy/hKoCtPT+4RVuMiw
         Hi0Y+9E0xEQnTu3rIkpMahDoauHMfZgNmFYYjLuyVHfTwxaK7JV7hqQ8ii2IXVdlHZn7
         9c7MiarI43aZ+33s+sJBXWAZiS608xjV77ewotI0kpo3zG676qqDPG6vkl13wQf/re7V
         fKKRR3rsr8ZeKjT0OaPdi+qLXvaZoocZLC2FSLbafTaUQl75C+tHLJPQNVd/O+HpPBly
         15BFdKF0wta6LZZbp7PM7S7HvNMdIwq58Q2E3sCK4aryAnQZ/Zmq/YWizYHxj01sJPof
         KYXw==
X-Forwarded-Encrypted: i=1; AHgh+RpUaBSI40qRyXaAiid8VZsR35S/kMRkSLW3Hgx2uxFq8s8mKRf1phYzVw/1wcAe95A4RMYyv1ZByfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKn/FZtHPXdDjdn1bYpgV8ncTUGR+FH2/Ie+0O0YJA/L6Iild
	PPr1WBhMbw6ESn2YwotauL6AgKxbdIXgRJyWbRSyUy5waxs4zRz49sZ7m5DBJBNn4Wc070pcsjU
	fXMDBfPz0WIw74LOIeT9ZacuRymQuAkLElFGwyusCASTfU0udscJxqZwWI2Jq288=
X-Gm-Gg: AfdE7cmtTBs+VwBOiCjmggglY+43ezc8Xf9uVs6U0uNsNz6ry750ZIOuwIGQ2uW7BQK
	OGTxv/KZZWGb5uXmLZKa0cnf86KDM6xsyCwwitbIUbWLq+IqeHQijxnR3yxONBBqA3SmwRWbUf0
	KuCnJ6pu15kOKnymgu4MPet1cF6+WAsapQUxrJQ1mr7pDr1C9cRzrX6HAnk7Qr0tpNO7Lb36tjk
	VW0K9PxocPtXBKzeCK+SDRQGYuNFLYVDriZzx/CuwjKCJuuZeqpi8ECrrV2K0U9q8y+uNUjP7tI
	QBfnZcCVdlJUJmK5iSTcb1VCsVxv3MPG8hVAUdYNgVAoyuywlOO/pR6hswZghawaO6jnjCYQMnf
	W3F12f0eE7kIDa2E=
X-Received: by 2002:a05:6a00:9aa:b0:848:2f77:e2db with SMTP id d2e1a72fcca58-84c2952c402mr12536504b3a.68.1784544659100;
        Mon, 20 Jul 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:9aa:b0:848:2f77:e2db with SMTP id d2e1a72fcca58-84c2952c402mr12536473b3a.68.1784544658670;
        Mon, 20 Jul 2026 03:50:58 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:58 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:23 +0530
Subject: [PATCH v7 07/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-shikra-dt-m1-v7-7-7dc99100c6dd@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=6381;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c7IkaekY6O5VmCRVXe8bHxUYf8Y4vnUM7egoEzFTAkY=;
 b=TgJ+JI0oDTg0q+SW4brwvHU3VfQPed9XrQWp2/hFjp7PE3f2+4ssJS71BitfINtHSawjMIxNH
 QdNDJr06lq9C5O1Um4C2iY5YkaiLDvsW/bAmnpMJWsyBapDFFWgZzkP
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: -BF4X4YNWaUG_ydH-EGlCUBvWYN5WQlL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX9IBtiiilhvUM
 SzWzhPnjz9Rz/fS7DPQswCYnccGq/uuqkxS/OpdcmWgtc1DPNRiYdSoz0l9VbgOumWjeEQgcMj7
 1Om40uM3eJN5cJYzcYqTRi/k1DsZS4M=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5dfd94 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dm7ITHKX8Gmtf3-juREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX7WSORJ2VInUP
 dJKJ1/8R3A62lyizCe1020W5IXqupF7b5jmTargIaJRVxNdS+qJV/ImaYjIHioX5aed2IX3IMaE
 uWg7yI+Q2B77rhYYU88nkPi0+wwH4lpuD7tJBAtQNReNj3vk4oZYQ+9AaiMA8/R1LhmX/0iCIgI
 AsumjdS03lw6F2ChfJA87pW/JQE8VvsSI+3LTLAU5eAw1PKQOU1R/0Ggq1TAcfbCkEBuBJSAy/p
 74GkqSnfQQ0cPzAXtbhb6OBvRu/A+uV/4akwTuqOiXhRqX+qjY06JdN6K0xp8baRaR2JA7pkmIO
 qB6S727DeYKnQ6NtE4XYaUPNDfpNK+Rd9YJheK6xCEsMaNVcxCLYb87eIucqa4pLZ/VJiOSokjL
 hzm/OJv77pCNeGWLclk1RDmOlqGDkno9RxT6tKLE8ixWcy5w+7EzGOWiuuw25FN7pQVfV8CGKCF
 XM1i7khToeeRZlWnqQw==
X-Proofpoint-GUID: -BF4X4YNWaUG_ydH-EGlCUBvWYN5WQlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200120

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
index 12e4281f7b35..3abd0a686d0e 100644
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

