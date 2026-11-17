Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936524;
	b=ZyhFyMLT+1K3JpBC9q7Eigvd29fWQuRvBk/sdXD74yQNY7VNoFc66XEODFljQFZJVukd
	 d2UYwcJjPkjCSn4yyqNnYYl5rGzvo+srAXCquhyJnXpwY37REMcJeJdymTPfv8qlaS6CB
	 oJ9SzMMS5DJ1ohZYV/SmbItpxl+OzDtgjD/SlY9J9hvdBqvVrg3j+yamJv7d/99F63eLT
	 c2h869sVPoum+d8QSjtJGqo5IB4gJIOA84Zn2sUzbcZcaRmdu5Y3/ObIsH0MeR2bBq1Ca
	 Ubw0/Zo43I6Z/prnGD58Z+CN34n3l6i5VbYQZ+rVL7z9YN/H9+W1k5D2m5OZK8Yr8Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
	b=QfHKiTXDAtI5Kp5W/or+P1+3LVkR63OC0kY/Z0YZ87+bTb66+8jh9nrLFskHTzqaDK2L
	 O/XTPQzOCn2J9m0iyfU3GvI0rX8HwOs7VdbCrk8m1Jc0aIw2PJ4PnOdPzEqEDmzSk9NXJ
	 zhqpfnx+BvOf+CuFKbfa+y209DE+S6AXyjudLWdgQVZQgYqCuDVk6xoCgcRUXbX6xuR43
	 SqYh4fRimhvNXgLck/fNQctcrx8OZL0pU0PtP1orlER84UmzUvZvLg+isP0l8s/53HPhd
	 UhMm302caBQre9iHYHP984j5X73cP9NL/LAUpnJyD9hVwZX2+uyc8OoybyxbxaVhukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfUGYUI5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC8606A33D
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AC8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfUGYUI5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQe3J1916197
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=; b=HJnEhgb2bdQlZQjE
	Kj3chHu8kiRM9GDtJyJ5j9eKdiU34ayyp8yocjjJ7NzMEMGXXjAHYO80adE+dv9l
	IwJTnWmRmS3mqivaKRAv9BWXSSNRwn0Eci4Zw6+gFmIn1QNGapJWYw1ipIMM0yPw
	5VI1WASclYFa/UEoqv/95IlFHkMNgNduE46RommRNzv++Bb0JHJm8tTK+i+5VjlG
	l1OZ5l9tfLTzX6DMAzKpXp3SRPqmjcDZqfU7P6Fj4FAavzqznt9ERRV7m7wCH2a7
	ZaARfp83EReIFAkOvHx9FYGgaBTdXWf/HkRLwcrdjsnoFJfmNYWzS0BTL5WYs3OK
	EmOlfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc81t5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:28:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so136202eec.0
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794936523; x=1795541323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=HfUGYUI5bLGSt3P0OKF7qFC2McEXz8w6uzdskEjdT5/RqHjki+Vjwd3M2kPzFpYBJV
         ljJVhcQe4DA2GBubeOI8ZPUFuFqF12BS0/zQ8VfNUAmINC3Va/KJWqvU+BJaU5U25XxW
         jrXZwkNSvSayRf3EjViWZt01FpPXEo2C2SWapRr6/NImR0peKh6v2WeI1EE8OtqC6uu7
         IG2xJ9/IFl28qN8CfmUaCbJF2NHWiWi25s5bD4luOGMY9vA6Kizpr4z0RUGmttVrIJTW
         IIHm4ueWzb0r4h4y8X2l0zM+acqJG7+jGUFMcqckQL+3ekESITrBJFTTJWvNssDsztsJ
         tooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936523; x=1795541323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=DccJjHqOYFvoKmuIBuxhPelpsl3h9X7jtRYHxxFa0gSMDgx3W2ukWMZPU9oJwAiquM
         3ZErCRRPWHwAmvpSqpdB9DBcPBoKwZ0rrmkzsydUm9i140cbuawM4CFafsvIYNEN7VCE
         +/7q4ozXEjSbOK4464hbPO8Sy06MMP5PpinogedoNS10b0DaI+eEuqp7FWwAhicolFVW
         DTNpW9BzFCRK0utt/KkCzMCw51nqFstGUyH7PVd+CLYkhxh0eCceSq0NW3dXAbm0oSQv
         DbngicM6VS6xkj53jUrL1ucJL8QN/onfg2xg0PTgvBSIvxQx3UDakge1MMDQHEElK0Rs
         v0ew==
X-Forwarded-Encrypted: i=1; AL+hErEk4q9ydrhasZiKMkkckMGEmDgpiZA/dlS94CSPzsL9mFxCKXXwQsUZyhU6jIYbtfBJR+jygQMng/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RUMiFyrcsD23PW9cKGMuspbSkibN2yM3A9AtEd84mHAsBmYTQ
	uVYAWhY3uEMgSBufE2UE4ulwusWjhJvQcWpEL8OtNrO0YR8EKqu1yknojPJgjKwpF/gllEZqrOS
	fnAnB1FBuSiJ5RKuNqu8WIq8P08NdV0MJdWtVLIGoqdslBoUbGDyBJickC6W5Me8=
X-Gm-Gg: AYBFou37lebQFW5SKgyvpwU0ot7AkfcJikwp4KiT/A9J/ztZIpsDOexK/2XB2nnfUan
	UBBDUshNySujcJVSVzbWAD2jC9ZfFUoe5hJGTmHL9zbM2OBQA/hShebLQrqrxQZYLJtqtB8xxCY
	YPDvvQYbiJ44E6qZonM6RtCbxwP6+BSTfKiTR7c4d8YlUGIA/umv+Zf3KEHGJad1lAj7AK6TbaS
	k8fJKh7C7TWsqcW0wlf2CJfFASVE3Ra7ueoTDhEx/aLXj+w/zxlFappo1zkuYRkk5xdE5xYdUHo
	QBMwYKzZpBQ9z8TkyUJIjAThrxdxcQJTXo/zFlirxuEReD9y9RBzQZV+R28lBcjAogA0o4L49JO
	QPEy8GbP2PjrYI37RDEcslNRg0GsU0kpWrF4ut6BLPlECewKR3Yzq4O33hwR+MNX/BLHchjkk5F
	ut2NaJs/D1J4+jeIcg
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93351eec.14.1794936521236;
        Tue, 17 Nov 2026 09:28:41 -0800 (PST)
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93316eec.14.1794936520694;
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm48943359eec.23.2026.11.17.09.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Message-ID: <1d294300-0077-426b-9bbf-35e42861236a@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:58:29 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
 <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
 <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc8ecb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=rBq-xhpCJJ2lye-X4V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfXyGhIxLyTsrh4
 DEPTje+2r9Vd9n0DneqdD6g6l9mZRe70xPWAtkM4gjGNmU7kBgQiW7SEEyHJWPKVmF9XSwVGZEt
 lEbZekEm/0p83VFj/kZQKIw0hfuv7XA=
X-Proofpoint-GUID: tY4B-DFExZXRWg35_jIFc7LevdC0lyYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX74Kh8lZsc5zi
 7dA07Yn6mLlJWg1SJb38gCG8cyOZUX3twOEVRMv8Ogws5yLQVAo4qtQNbs5jA1SJY/sjkGkUXIX
 BGw5nqDo6tR38oS2oJtmcEMoBz+poWezo2Li+Y2kVe5rGCE+ZNGaF4J98//MRVCm14HTtxhQJ4I
 bXGnoV7eBZSG3ConVAgUuyisZfznU3LFY1CsvlmfjcH5LQDovVZ8RBaHH0KnEwfEWEBsfmECNwC
 t+NAkW7kuLds8b1YT4To+KxlY+ENdmHHCIDvAkrxRdZ20T141I3WVkTaPjqcg0iiMvHVQG8lHj9
 rqb98sszsUmPuYcS/05C1No6rAxXW8P2oGZZtGAvyiLxO9FNj0PpQ5xMk4pPz0+6kPakPSF7+Da
 2ALjtfY09n/jjUrh9XnF0jvCxYuOvHXtof8rHW5p3qpPKPd4y+BsSx9j0kkLGTFAL2anWJvb7kA
 EVJlCdZ+YOGNpb3gKRA==
X-Proofpoint-ORIG-GUID: tY4B-DFExZXRWg35_jIFc7LevdC0lyYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170069



On 11/12/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:48, Jyothi Kumar Seerapu wrote:
>>
>> On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>>>> +static const char * const protocol_name[] = {
>>>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>>> Why are you creating holes in this array?
>>>> Hi Krzysztof,
>>>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>>>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>>>> 6–8 empty.
>>>> The added NULL check rejects these unused entries before accessing the
>>>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>>>> ID 6.
>>> And it should be 6. Just look at uses of this.
>> Hi Krzysztof,
>>
>> The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
>> This enum represents the serial engine's protocol IDs,
>> rather than consecutive indices for the name table.
>>
>> The SPI/QSPI driver uses this ID to request the appropriate firmware
>> and validate the protocol read from GENI_FW_REVISION_RO. The firmware
>> loader also matches this ID against the firmware header's protocol
>> field. Changing QSPI to 6 would make these checks expect a different
>> protocol ID.
> You miss the point. This is just a table for Linux driver, not what is
> programmed. So please explain me, if firmware comes with new protocol,
> e.g. OSPI with id 10000000, are you going to use that as an index?
> 
> Really, why are we discussing this?

GENI_SE_QSPI is also compared directly with the firmware header's
protocol field and GENI_FW_REVISION_RO, where QSPI is encoded as 9.
I therefore propose retaining 9 for those comparisons, without
using it as an array index.

Can I replace the sparse array with a switch-based helper that
returns the name for each supported protocol and rejects unknown
IDs. This avoids holes and remains independent of the numerical
protocol values.


> 
> Best regards,
> Krzysztof

