Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977329;
	b=2JVaBhU/Z4Xuc/j+q8GMH+Sc6+GRcPaJ4/U5zNoR0vrvdIVTgMD+ONNwijQLvDny+746
	 5ielVWAiTDBWoWd0S3ayBiRitBLtiptA35oNLFy8nDyG2yuHI8f6+aeCfsZAI7ttxh/he
	 twtzb7E5rnjnmzsKFWfARfWYZQTMA8XCVM8W2lnkSeGyvQOwgFjw11tzedvIk4UkQZWIW
	 uL3h3tfoZhsLST730I480UTIqhC1tyqAr7zOEMHqPpa4G1dfkBGgVi2aCG0m4cYdo6zuk
	 zDLmG1RHDUHzbDKdcPRXpgJZvWL/iCI+99sv30aWhOwvM8NEVTXepsvNxJvEU9BitUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
	b=JqbUCOKuKk/hbHP5lMdOqOQI9CnS8PtjiWmIDQEepr4dTGUIxDAP6SeuqWTMg70Qm4nm
	 ZBKc7JvqRFg1Gs5rYHCwBs4qnTtEKPnee4NXJvjUyWUapbDtt1SlS50rdqRSfEHEcnGd+
	 4KRCjVLw4iT3S4mWen3GAGWlKrV/+CIN1QeSojfN+RXUiARDmEySJPDETpdFH5pYgIgFx
	 VQ9/kKr8WJOVx05/ralTPyzccxeWiDbuIPFyjHV0+4mbD5LYwqvXvjyjsRbs9OOdOAtjJ
	 DG2UE2cqmquP3oBK9NdHcwpLxUsDGJVFu1OsDOf0g1l1k7kor9WwH28GVdduzPIPBaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0531606A32C
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0531606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F03k51121943
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=; b=SDZaldbOmYwG9NEj
	hM8bmVDNFqSSe4M/Qe0rvTogB1uxI7CoLNtl0nHoSNhO2/lXxgR+NS0kohM4SeP8
	ZTTyMogd29tIx+VsK0Y1peZr5KeQ6zAeYxWBbQAtW03cSaGVqqyvmRGZry/Zsu14
	JD3u0XniyklpslbdRRBws8fC8HN9nqxSSklCOp3yYpDmGN4slK2p2vbVQtro6Y0f
	FjvWudy3MDjLg3a+tg8qpvx7L3H1LeauMZwclexb0vmVD1/IxAJ86XX+lGqz2rFT
	NwHX5qwFvmeb2jGM+xUNldas+5nAfCDNtusDBYFKxVxxV8yVeKO6pxMHcBuTaFcV
	ocpQuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u8xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:02:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso742639a91.0
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977327; x=1794582127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=a29Yh8cU5DH5boyQ5JnEXfDmNLDEwuoLwWF7eZfcVoNKtcwFhIui1WhgUCp0pY/BY6
         QjoMBBTwvUa/Q6u8p+MxNAG903gsnOKapgxhwvV7zjD/HmD43n3CNmkmUgYt2nsPtc55
         /EIqORXvyUOWyhDfsCR1KSGFcrCfUca6mVxM026oy94A8gNZ1x07omgqwzmnS+zsNtxU
         GfwJ9V9HZzCl5AREfhFaIlSFZGRUXT68fVhYNFd51N3FW0ZX3jT+XZ+8N6ua49t0W+9b
         ZLYtW8PmjTSQUjypRFyEhoOlbWU0emeQmobKbbvwPaZDT91Dy2ggIjfTPMsHJ49wLrgd
         L3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977327; x=1794582127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=z5LYVw7KtKbvkRdPrwIh0T+wta00XNVxzSGFsPvSJHuN18tDAOMK1nrL/Rh/4IlmKc
         JHwvby/BMG9kghICh0ozaVigboNtICdh9W79srACFlpsoivjcz2Uf3pnw8BbGQJPIoOL
         p7tBJsQczLsPotcxMRw6od3ynIegkHbsWdiX2sgzBNxqhHlYqbMdAPLHgyKp4iiUYShX
         ktVpMnWSE/Uan3Egh+umyA8KCQ3vyZn5dxr9JR9Ez0IEdakRi6zpN31Wo9UtdC0A1Zl7
         AkXXMvvr5k1WE5yVYq8YjQPR6+M20Y+r9TMhilW1Ckjpe/ls8x21oZQ5dKwn+hgj+qX8
         3VTQ==
X-Forwarded-Encrypted: i=1; AL+hErE4cEjcQE0ooic0Mi/gn8c33mAbS2isQcsapm3REU9RZ0qD54oBM/WQUoU2V05nXsCH1W/MUNdkyaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ffZZQpWciU14AJUQcmGID93giSwhFoAsA8+MGmSotZAx1hlAP
	TkKlwg5cc1goowprW2pH18E3dSbkYxKcyoYeuUMyN4pARsYInUWkY5Muvo0NMv9AZ/2e5EL0eC1
	F/AEwgUZZOhxyV9dZrMlazOsZa6bsrcC2LAAG/8ZGfVTP/qo/lvTyjWm8jbAoI2s=
X-Gm-Gg: AYBFou2ZZVD3zlcFyCLWF9uY+N0MRGU6ciANCEZygCk29vB7MjWD4AGYHgtB1+ephyu
	TVepMN8FvX3qqUacXnTRPV6BU0hX2gNUoBX4mwDhn6jWlP72t5KZ8hkwv1W+a4zaV+IMGbJWnON
	r1Imsgy8YXsX2Kb3I4CaDydpvu1qxW7LtG3gcUu1x+d6/YhUUWBrysUVzxDevC2IaYk+jTfV2kS
	hRGI/1n/Ty+LjPo7uPb/5h+hAn3DtARMcIQ0EPZ2qaRpYcke7i/DyBrzMXO4HC3MGaWysC3WByP
	9jjCclkol2vpyFD3K3r20pSVcVKY6/IktkfReV3+STTugrW+hpCFc9jPdvNRMvhlkCZjAwkWrFm
	UTK0OS/vixHttV75mS0NrS9rUld6Fo/kWtKHNBPtZS31pWgEIAjcmdIMp2OhCuwAjTULGjQ==
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344798a91.33.1793977327102;
        Fri, 06 Nov 2026 07:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344749a91.33.1793977326247;
        Fri, 06 Nov 2026 07:02:06 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:05 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:20 +0530
Subject: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=856;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=iJecahOznZMfSn1ZECEomSzUGcetmfIMkxUzE7I2o4s=;
 b=B5SY3JrN4UIDmzeORd0lh9riEKx7+MDEpI/r2Yb04WH6sz03eNKv/Py/s1LJ3p9cSHMUByaFT
 yK4pOmm/NlPAouJHsvCk8M/r3gq3qJbwpGP+ClC2qE9librYyE2HFba
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX21xB26QUTHzr
 NanVxjJk5ettaa1MFfOh4nVQpgHL/g8ReBh3re8WP25kLWvVK02paxVoHxJsBP4ZT1p9nMcqE1F
 CkrizqOE8mVrM7Q/iOGiDWN0jPU+cHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX9T3wyjpu+kWR
 OmK8U8LdOHpdD52Sr/GB7wN7TnUylsu1EQ+CBE6N7z5rgOIqr7QB0nmVGD1KznW69aDcn/szOHc
 MRoosxcsT2tM7l3sVhBBydRPX33EuPgIuK818Blyk0SNEdA2J3bHcl+35U9DPBRlFW5TLj/zGr+
 DskF1XKnxkcdHWjjKi+nk27O9s2sosMzM0sDkNd6lx2mc2zvfDLeIazUoPFjodjJ5dqeqP+70gG
 GvqRDT2wrD5pCzuQtLDQGWAKRXhwsEk15NA0VhaPQBT0FbJZjbVfYKx7Q1Vd2nKRJquDibzI2k/
 g3b4PsZvwd4UxmLaXSFOQx69vqo1AsckTZFJKGixXyNc1K65cvPUYzUsE4LXZdYdaMA1MPANd7d
 5F4Bk/Itu10gQIofIzhr0JJjGnA5OpycFktYXRX3/aFPCjjsM9pB6DTnbgh0mghHQ77+vd4W69V
 PNceZD2AU+0UYPYbn9w==
X-Proofpoint-ORIG-GUID: KBiZ6BEYIVMXA3eB9aqJ18hYmuoe1HxQ
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedebf0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=htPuCn9dtfDBuPHNxMEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: KBiZ6BEYIVMXA3eB9aqJ18hYmuoe1HxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
specifiers. Its value, 9, matches the GENI serial engine firmware
protocol ID for QSPI.

This lets a QSPI controller reference its TX and RX GPI DMA channels
through the dmas property, using the existing channel specifier format.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..68fc1414af55 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		9
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

