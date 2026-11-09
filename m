Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242744;
	b=dRgZXs1TqjFpKm/Km5seNumQzSC5tXaZhSbU9ipV9qbItAndEyR4f2eCOz0dlmlMfzOw
	 gRb5xHxJJRCiOZtjMzqs3Q7aolALQEu/vMdkFlQr8MKUOWhzUizfNd4GJeDLiJSwAMBZI
	 nZg4QL2TSETz+yldQi2x29BrWjTVF843/6ke/msDXyrpS5VGSfl3jozWOHkmmMkHhUU2d
	 OQbLG/nIPAd97PsYtK6r2ckc7EacX1jJKy7OjLXiBMdmDGmhmXpbqN0GqYN+4OIBkwHiQ
	 X1vtnAFO9g9CoA6pVfwMgCYLjQr96Bcfr3uoii/4E7hJNQelcYw6Wd8BHTT7jZ05s8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
	b=lLlhyqurdg2cx3IzOvULJPOLGiL9ILf7npPuQh9U6QCHQg7RoLA5HVPbfN+VpHbvbcQu
	 WvvuwZn+PrL1uCQRTEClHA8/DyOQB/ZvvEeYo48pZZnsDTAFmRPc3RRCgo9AGi6jhRnUV
	 l8F4QqDeHvqw8Fny8kzIXtkP/BhtYSjiFExsW+6MrgBbuddFc0CqLxgfv66L47PnLjTvK
	 Pfq0Ifm0TsXApzaNtC2oet2jSzZcyTgcpE0u+Y6zTRFe5Wwpta0niTfZxtth/LDpQqvXk
	 mfffViGiY5icPQsrkBjn9Ky6KjV6Mn0D9OaBS9IU8HiPZa9I9R7YONDOqlOWte/8h8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D7606A33D
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 16:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 555D7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFFn2971364
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=; b=Z9znmG26EPaUKSEV
	VRmBdJyuq/dFZiiTn1J2Anbbvsi4om2vKXrB51eY2pi22iW3s7MXTtByigsccPqU
	rOTBswiRDzhk1/Pdgh/sPuXwW0bsjZ89D0S0Cueyfs2L2fxwl7NnhCrSulkvepbM
	O2KFLbserTnhvUk7KLKVorj2eQNbC0yS5EpJA8vDz2246cgugo9CWPKNh52oKoha
	QDc0a0ue27Y9ssBfOe8zk7IruUnT3Ku2hSp6rAcOtsCuy7by17IGXgre47d9HMB7
	Qu97Mp2Hz2vxE/OjDX07IPjKVnTA6BJ1JfSXxKZg1wWHYmEnNiqP0y+LOU4awjtX
	MLjTXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm43w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 16:45:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2042720eec.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 08:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242742; x=1794847542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=kHrtfwZFqd47WfddUOdWZKA/pr9I3C0Mjh5EpKkgM5wYv+wYIdMAD8eboLskQ2D+OE
         R10tXlf+XCJ3U4KLHiCEIl4WJ0z9k/1rpPcU5sIpQveESP2qbB4AqO3Bew05Yqi6JE8c
         q+Ka8CBpY4U0AFE0+3tw7XK6m9mC5ystpbynrbOYm30NaWyfYNXmQf0OLHUqcDMHU3wl
         9TKdyZ/pQHrVlhpNdTZZmomKW/TTeDZDgq0bCYcHkffvrPve4iNrtpoqV+o/24XlUK/I
         LauKMk9O9JYrYRDetrmmhLEFrSgx7W7PGL438LEvR2bMVoRfOnr/erTr1pVWtZ/LDO2N
         mpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242742; x=1794847542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=MjmBK+0F1KQMiL2qU0H9Mw0KJvLDw9RIry00eMqcPYrZJPkNLAT4B0szPXJPavk859
         SKINyZLx/qmNd08//AmOvzslmEitdUXqP495RndLnXYTFaYHdvX53P00b/xm90CrT9kn
         0wW5U5wVTBwF7c+mWx+WxaFhIcM4p5Bnxvh/nNueMnf42i08V0czmMgQvz1eXWvcul3V
         H0JlxuNfLVoR5/O1w+4CVGQXQtMnKRANQr5AOek6kekyVztqb/ygM7Xh/Z9foK/zUML7
         yjJmGmwVBAFOooW6hXhdzYieocLhVcZSodVY5287MB1gHQtGbfhjrrR38UaMIRWaJ9rI
         QElg==
X-Forwarded-Encrypted: i=1; AL+hErGp7YMYSDK21XgJ6GM1JQ5BrBX+NT1GIIjHQa9+Buj3kg3BxELRQu9A4lVw4krjwKi3EfyrvuUHSUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S7CRnE5TrTMXoOpPhXdOmTC9ZdVrklPqk+IQO/F8o1mMbXNpQ
	oSug1+d1r623HRqGI0+00N/93Q50qln/C53FIHQE6msFJrb4HbgBudZ/9cIpn6csgR8mhUY3XOk
	YVo9l2fYbzJEeZ41xLQJvvZKJz26kgzCycZ689+2xT9sD8sXbsSn1C+W+ig39cbE=
X-Gm-Gg: AYBFou24UvvcYjgupMgjPbnIkLz2RAytiiH0T2EBOZuO6IRebmxOpakEoMgmkhUpyFL
	J9j6uiizjBj7J/k/LtjU5ATvaVwfd2VvGt9Yn6ZS5jgBPrX1mcmDLYYZYBDo6WxU3rV17bT29bD
	jqvCuVOx0GYe+/zG4l1Md1mqxM6QXD7HW5raIsMATCV3prikTUdAjGvRkqB73VxhfFQJoTXkmqc
	LoM77ovZBmJar1TKOmZ2PBbV9VIdwHKuGKnGt030qwo46QQiJSpvPVaUVZAvFC67fm290i7JFuG
	e7sJsZpUeZHR/81mJJYh7w9jjJ8pROnWF9vI8TivIhHcT9dX1LHTQXwo5tdhRM5myrxbQG5L/Zh
	xWBb4MkRf49UVslzCb/9uV1zQLqq03M3z4EQurXDo5DCV4JT4Nd4aYqP5UT/MA1Scml1khyF8t9
	/sd6gqv35HW2QgRneOT4pczNPjzp2jDzcZrKONhvVzXIuzPljagmU=
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459350eec.23.1794242742024;
        Mon, 09 Nov 2026 08:45:42 -0800 (PST)
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459297eec.23.1794242741349;
        Mon, 09 Nov 2026 08:45:41 -0800 (PST)
Received: from [192.168.1.66] (164-34-238-49.southernonline.net. [49.238.34.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm15132197eec.20.2026.11.09.08.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:40 -0800 (PST)
Message-ID: <37560f54-ee44-48a2-aa33-5229a4087ccf@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 22:15:33 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX5WeqqhnnLnni
 GX4uR4KPWmVqLZZuSc6X2Gl90XcwVsZiIS9lH0II7jUdJxW58LTp7Cd5h14sWPLytb/XK12pm9N
 rVMVxN00ru3QmY8CU5cLFTLjhXHBeLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfXxEPz5UI6xrcu
 nmmeV0kaI8gnPKPc+oxyXc5uLf8umVC0JEWCqsh+ZYZhGMd/HVlK+niH5UIsfRwWdXO+VwkmnyB
 IMI3AdpzR5bQoVbvYV5Ept+R6uSkyXKke7rWGEgkAhI7C3efeJghBoov3dd6b8wxykCLSgyYmCB
 5wy/yE+HrAZTA0HFVKrkujKjZvVMRj2I2Z/PlHKLuZtjCvdlB8Y13hlaHlLiFpcPgGawvxg0TIE
 sTncilg6wD/H6Auj91dcnz8X/jdFmpa0mS7elTWTeMgX6lF1Z5TrF9aCWq8hdOeJgN6nokI4cL4
 zTYFSvOpBhRSClQYjLCWWKOVNxFWxjASzhniwz+LWKio+OEASLuwSYSxRtHShUE0tRS6Rp6QBy0
 R8PTH3mYsbCVt5F5IQbPQZW4wSluUP8vGzZCPFRcv9xDnROKJMKcAnbhJ1O2nw1EU0tFlGdg0w0
 mjIhUQWWHnNzoLWSvzw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1f8b7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=rh678R6S33b4aGV2lqlmMA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: CVFY9gTTauvb6p18VE0SviclIgXG6_P5
X-Proofpoint-ORIG-GUID: CVFY9gTTauvb6p18VE0SviclIgXG6_P5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090066



On 11/9/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
>> +};
> 
> Please use designated initializers for all values here
Hi Konrad,

Agreed. I will use designated initializers for all entries as mentioned 
below in v2.

static const char * const protocol_name[] = {
	[GENI_SE_NONE] = "None",
	[GENI_SE_SPI] = "SPI",
	[GENI_SE_UART] = "UART",
	[GENI_SE_I2C] = "I2C",
	[GENI_SE_I3C] = "I3C",
	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
	[GENI_SE_QSPI] = "QSPI",
};

Thanks,
JyothiKumar>
> Konrad

