Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047CC386571
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652906; cv=none; b=dc9A0MazLT9R7mv53oevNG14uT5Lov6QGfu4g8xHwiJR5S65ZKYbdaUmNXxRw2wBk++ZHnnsakobIkntw7oAgZslwjv65qDuK1gUswv9lVZ23vk2NMoyKvAuAhODVD9RJtBjPvjv7ymIsjq25SVgPsmysJ5eNxRKLLlE3uUnsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652906; c=relaxed/simple;
	bh=tUOGkrU38mJEYQ6zuey7GmqIR1DTnR211ZbxiXdMIpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlInk+x7fGpUhzvesy93dotx1wRF2HyyzO/5B39C2r21ttvbo/LwOVCqfOIpRInkqF236Fy2UMBUnJ4KHms/n+dce5Gxv8SBhVCMPZ/WNoY+TDfiZQRoOnpuhV5kq0sN/WwyZkBdA7JqtgyuwVAaEfbXe+jeNTkJt42zwm9QopA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjCIE/t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jifx4CeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjCIE/t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jifx4CeU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfvaU1687427
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=; b=UjCIE/t/65fmEIq0
	kq92YjXNqmxGYGE81D2sfm+knDmJT/TNZRdGfegorbV6og/Io4zCHGkrO00UtGqQ
	t9wotnCGH+wXIzfdOzGVy6D2b9GDO1yT/USMFtBiwAjS0A79zcP60xeA1xs7SvXT
	6OPFESLQ+Jbu9E1tgZEHuEO0+NhPLf9b5ZNtt12Y3C0hj19IOM1gjQy9xjs3Ujx4
	9iArhVY5zAXHwEeyqnYgCY1iD8GYU274RAnrI79hI81eSmNiopFcCKpLVY45PRf5
	Dn54CcHUJ+vl5M9qF6rCNXRFDaMDjB9uDj51enUvukdKRwFlTGQKLgnr9QUAYcB+
	XBUPiQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41461-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 16:55:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso9266694a12.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784652902; x=1785257702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=;
        b=Jifx4CeUlstoBuGCBbiEktS+hgG71KzAN73QPYp7+E+r8AW65LDQ5S8SYw/YnArBd2
         cAtDQMN7VhvptHZ+7txg51YjY8pHZn7BpEjgoPuZENocPoCKMq5r8Hbk6SmAArmnvwen
         nrLHPZ82ewbEqSh8oZZnbN8lB7HSO8StSI53vD8OjJIcfcp5przvbfCTy368I8tgWft6
         UdYLot36ZyPJzml5Ni3Ka4D5vI6RrMa0wcYlPr9TaGvfLvN/hBW5Mx1MuB7XFl8vNWKD
         /nM+SrClM65Lv+QocMRr4rYODgSo2EvNuceqyrkEp8Q8Nzv4/4WZIFDfeSdSAI/UaW2I
         c8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652902; x=1785257702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1o8yex40q2dVFxxH/gSrgSpN6Ch4JjKqRjhqPQXctg=;
        b=W40EItSVTM8oNrt+tS3g3s5fYkPJvVSjrnI7l2ErK6L7F9FmfxwFVwHKj9SmBJUGZ1
         BOMt26IuS2At9BFUJ58MSBjqFnSDapDPtvDLTkKkD+VC62mrgBwTf2xOBzhojvISl0yK
         tuuTLFtKXugvipegSAOUdZ/UKl/wSeAZXlhLa4SkBhLXgBlT8m3lxu/2qYcN4XFVP9s6
         tzEh6X8KptniBCvkpbmutxm6PYikOQBUN7AFiPPF8ZDpu5Cv/pCuth8GWfmkISp+brrI
         hG1/KsWzIyEJls6Bs8ptF6/6EYMRq06i7XVB/qlzyoTthL2tPlCedO1Cnvn4bqsFMp0v
         vpOA==
X-Forwarded-Encrypted: i=1; AHgh+Rrc+DBniSkPRQFpmOoNFJfTf9R8N3cOiud/IMarpbc0wpDytfkMsPA7U3xKb1rzHtJkMr0a6gTlggQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywui6xvK6fYv7KWpJ+TfuCITu5hHuXqFUIs6EpnEYPDL+3hARBT
	MLsE6hcQztR4E3eu1+0tD71ej+ezc+5csRhUdgmNbQOrxvxEZFJzcPYtNog2VJJSlue6O9zOTEL
	C7gPu5POVClDbtHL91y0cLtaKRkvQdQirkHxJ/6l7CObX+CzO32PsqIBABJzWwhg=
X-Gm-Gg: AfdE7cm7+ZOP4BoGriP5YB7J+U1AFHiu4NxfZsap3Ie21DxEOCg7rle/jL7bqWfHdD/
	th24AE+yMHUPefserGb5A+Dppy1oTPDkgxOjI2lF+wHUzJq+QimQcDSai5ybEXdWwvEmp33/Mwo
	uRI/+0sPJTu7geiP42EFcVFE1Jfc6pmTNtNgvA1DnU3WwulN4Uf5ohi+9IZrCf7dzjhJuuPD+tU
	PP0gZt2b9Kf4AFgfKEivQSR8JHAQ7AhBqoSS4Hy9yZwPaLUTlyV2YlbS7sKGNQQfHiszY7C6lLu
	vscPg22/LgzhneMJZeg1inPiGcj3+8Qw4qlv26iyu80K/A7LyxtNHEHvTUze+ZGTr5VkWy7qRWd
	IzU5l4xAO4kFb0aSR5xOJ5ca5cz8n9Q841jki/JK9a67bVv8vPJd3nQAUFuUm2h0AzIy/kdq7
X-Received: by 2002:a05:6300:2704:10b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c417089d37mr2522201637.76.1784652902522;
        Tue, 21 Jul 2026 09:55:02 -0700 (PDT)
X-Received: by 2002:a05:6300:2704:10b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c417089d37mr2522176637.76.1784652902041;
        Tue, 21 Jul 2026 09:55:02 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb4:d969:b5b5:8f5b:ef15:61de? ([2401:4900:1cb4:d969:b5b5:8f5b:ef15:61de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm657080eec.8.2026.07.21.09.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:55:01 -0700 (PDT)
Message-ID: <8885f841-798e-4c8b-af10-88551f39f2a2@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:24:55 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fa467 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=k8JVevEbTmNoh4gevwMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 4KthgTXEmv6W1ADp3juRwv3slc_-QbNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OCBTYWx0ZWRfXw7rwXbRFviTA
 s5x+JyiMXivx+juOIgab59H9rlzctEAz5P2TKnfW35uY1oR0JV2h7LnqlQYoEqhsCddDGzE+oKD
 iOQQmOLfQRsF2BVj2pHkiX4kzgADUyiulFmLsa4NEUdS5N0HpKzN4G8bJbK9cuaop17BHwoXYvR
 Jp2CpGkwiCqzAS4rYXBsZGorK8TN0phhKawOHxFe8KXm6+yfkP6lzwa4xyQqyyZ7JO7IS92jwW3
 6MiUfjgXWC+nw+BNWpg+SPiNvxU3sQx4PNdYB4OWwiKEb+3dP9mp7DXfCcj/cbwtpt3nFsAq2jo
 6RMGIZqxKG68Flbz5kP/Jpm3b5d0ECuDDNUO46jhLRxlOsvuQTthFGK2opO3qcMksUGHE2fNPl/
 1gVDXL6kiogjA6SvnC1W2CLFeoLJXuKou7Ems7GmkVnddupKR+bIG2MxXbITLAJLkasLA2ic8Qf
 JosyUnZSfKc5uCuSD6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OCBTYWx0ZWRfXxljQ0FhK+t5r
 YttKdYkeWNYbY5WUtvrWyYb4uujGIJzy388WmqOysbrivt36MdCy0yjywyQbkgnnXXMFRz8ewx8
 vzfK3lXo+FWexI9HapjF3EHygXhTQuo=
X-Proofpoint-GUID: 4KthgTXEmv6W1ADp3juRwv3slc_-QbNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210178



On 7/21/2026 4:45 PM, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
> 
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
> 
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the protocol field value properly
> - Link to v1: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com
> ---
>   drivers/dma/qcom/gpi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

