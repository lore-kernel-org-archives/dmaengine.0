Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235677;
	b=zqhhkDUS0hiDJcoe/45UvwHLCnmNtzcZP5QpV23mdSkwylUjuoPlAtIU2xcAi+kOKteK
	 KQY0YY0MrA30mPCMR9t7ooY+AUKRsF+xPfiqCWXMO9Wp1xGmQVNHH9XSbTTyu43qCqqkw
	 GGQQ0iYSEWI85pTfsMRZqeCdT27aaI3C1pQw7TrwTU390Zme80HufaIiwVeTrcLUiIgf+
	 6haBwYgtXp7y2apz24bFHuuywpznS98cFYg0p8CmicW8vh7V2FKvxTnXJnFPWPp3MFB3L
	 90GaMX+PVjbwVjgyNPHmgpr4NKcl2c7huldd+WUdy+nVIo+Av1RMzVP/KdSdZE7dVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
	b=tfOzHybAKRLq5kmYjSDBpQD959TI50Id39uWDB6Q2s+o86kXOTkxsvrROo+gYuRZ+m1t
	 apStX9De9Bx1zKc+FDjw9U4TpTGrX/m2bkVbQo1aRPzFu62k/VuYxyX4WlW9ibwg4/V2/
	 aQDO0r5N59N+sF+AK7o9Lkv81noHLOI0Uwm60haP7yJkBv3vKP6XhFfTXGXykPMI91xZm
	 XNzBOdBWm3Rv6A3htb7LI5WUZJTCsVYVtgr3uN/HO5z+spMyEklv8XzmXrETRLi7q6PqU
	 +8awQC2EI4hEEQoouZjaaSOiaiM64Wa+DeI8AnJjINP0j+uHIpRhTsYlokO/u2IAShw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E50606A330
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 14:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E50606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFVmM337586
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 14:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=; b=V+4ERrG5i3T8g0Fd
	Is/6bobd+s8g0yAgT8c5rZRtQeeTMs+UNr/k0xVQZu5BNGkn07kkYc3GFwGBdtfz
	JLXYbROt5NleJlGxig3qsGMChILhk5Z4FCqqRbrIjzagCTEvdWQdFS/fFFk6WTFI
	uDzWWSpqUNF3Hw1uQD19qXqneF5LTVK/saAZEWmJvYq4kETLsY+77mpmi18JtOuv
	uvkrQ/fOKX9yLnC34jXUpzvfpbh7xR7hHNljYZc68x91gD5lrHhVpp0SNtUDceeX
	XjACTel0HmBAMWfM+WOOsyhq/wl+9SLTUdt/OC1t7YgQ7ofQTdZgLoEFYxi7cp5u
	fF9ibA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rs15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 14:47:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so43319e0c.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235675; x=1794840475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=DdDGw81idsDaSVqJdnLFw7iYk0LASCh6eDnLvNFODhpqbsOgT5XiqfP7hKQ/kK2+WP
         liUV43mHTt/nHfUgG0cAD4E3vmKr2mKLbFWZikdmH0uEwmYZUeWUVC0bYuegc/HZxJZm
         o0ZPV+zOceM2/xNDPTld/Ir5qz2FyMiEzln4LC1R7IRLWElWAqtzyRsB66UG2r1x+S3l
         A4yt6ZAe0FuVfNfME3lW3sTIR04nKgTDNwwivCcw/q292HHf71kwV9BuVleExMUtK6IE
         1dCBKJE/zgAXnOWyYK7z1YeMTNmnEcTCgHL973r43sBcIV/i2CoFC2XAf+dtuXETFFi+
         ckzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235675; x=1794840475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=EFdU1amfj58wvsyp/p1VW45PfKh4nM2qSrV/KL54YOem61ztsGGOH8clorwui/jRw7
         pvLB5joRNCTyc4JUULguez15bPTdjoSM1vwrdwfKEO3pz3XfOD732BBTqs2sNHEOx4zA
         3gKA5d0K4fUkGE14VXeUDZOwh47s1s4uD2iXkKlYFo6p5JBFs4XWmlZz7UEsgUybb1r5
         CcNNLHw3JgO3iz3nDz9xI9IclgybdMKJH6xMdDBtEh6+QVAHcZDDJzE02bbYruC8qglI
         KffiQEviLTAYEIWdWS535ASJOvL3+ka9Rj7+m4iQPpj4Gyek2k5jtTgztdmai0HiOSqE
         KVSQ==
X-Forwarded-Encrypted: i=1; AL+hErG7Ry8V3bGISxVWU2YK2BuqLQRv9zW9rO8XbKeVVln9Av0f4bkWfgMtnHudTu1bBvSxuGuGuvMvTK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Em6D4EeIyO0wDEjH8uUjHDdcx8i/UAPIH0ttf34zcvPkQQ3BG
	jE2sonqV0ghURlnQ86l2XlhWKDRAXqjqUanGbqOKICKp1R0Y//vnUP9C/Rl1uln9QoKhtK5nSsu
	a2x02A8tJ5YnJ/4OhS+kNFAvWnZapxfzNip8v9Kzt4REtJsTyFoMGn8PH2ZRYhIcUEEmnyGs=
X-Gm-Gg: AYBFou32X1wipyU5ahlNToFDoqXVnHXalcZMhRsTmQ6josEqWVq9FZ8ilHS3I+qIQB5
	/Y6ZOJPX50Fs+MyrSc5ILQwSfkBgI983afdJmkoNE2RbETrPNk/1dp7rnegVlQ4JOZ5IekFlYtS
	mof8+JKqfTfMZD4xvr5lFRRZoyFCEvugvaqrcp7T0iaJQE0thc7DpkQqhA/2Q9PHjbAzf8xtLQZ
	hxguQ3jO5E7jXjXqvIFxCcw/+JS74rk5GH8pENJ7DmsjSu5AUTiRyUOxgsYmj+xSYXcG5+P+oF6
	nnIuDVWhHQ2DrqkusYa/iYk/giUNkLRVatXurMw6m1dcPytiRZ3dtfyKxcwRraL0AYGmTnWNTY0
	55RazcwW2O/OecOgQ+3fkXOy4cFX/n1SENN2pSAVKBYps1xV5oeLiBfzGYjocpGsejz/g5Q==
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736234e0c.5.1794235675521;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736221e0c.5.1794235675113;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9384csm180195166b.13.2026.11.09.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:47:54 -0800 (PST)
Message-ID: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:47:52 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX3T6VXZuds9a7
 geVaVEj5MLvxDDq02eOg6YOlmynUEugeWY1X9X63m4+IJGtZZDaLHQqJR/Tf09J+wqysn+uSlHh
 Uavq+C0SXvAuZXXf9rSjB3f0gfKtSZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfXzO0WkG2FFjcn
 Z2yFu0X5O8Esys4RLn9VF2snAw6wf6u5YLbakNWtTF35bAcGG8K2uPropcETyc2CMWxGFf44c8H
 FhRGfM1CXDf9NwtsaI6mzYveqaEVSn2lQXNhq8YZOEv7TN3+16NjGjhtwKkUksag5UF1iwlYkPx
 mgXwyrPntg2Ndz8lxAl23YyngJ3MPvMfKy0N+hhZS6orY5aV21FJa+urVLIgZMj5h4duALX13TP
 xEra6jjHzP+uVaTmel0b3Vtjeu0yBnenZ6YpyMXnnGE/lsR8YcftPdhzRF47FjL+aveMelvK97b
 /I4VgkGz1AV3E8WO/UT2182U8KB5MkcTAHuyxY+qXSWsNIlc1ktkJ953TuP5B1iH3MUA8b23YJW
 Q1sToO3iBNbB+pAB3840ZhRzJni5pXKe1et/SKnTX72VvtRbs1O963u/nPrN3WVc/9C8U9Bwb7Z
 q/wavC3QMXZDOz9G8Bw==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1dd1c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AQxZ4Z-7SMcdX-UDKNcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: YEz6cJqugR1Scqx5rZ144ZE5IZCxosZt
X-Proofpoint-GUID: YEz6cJqugR1Scqx5rZ144ZE5IZCxosZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090058

On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
> this value to request QSPI firmware and validate the protocol running
> on a serial engine.
> 
> Extend the firmware loader's protocol-name table to accept QSPI.
> Reject unused protocol IDs in the sparse table before looking up
> firmware.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>  include/linux/soc/qcom/geni-se.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 873bfbd6b2b7..396f3d81d292 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -122,7 +122,10 @@ struct geni_se_desc {
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>  						"qup-memory"};
>  
> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
> +static const char * const protocol_name[] = {
> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
> +	[GENI_SE_QSPI] = "QSPI",
> +};

Please use designated initializers for all values here

Konrad
