Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216119;
	b=1k45SpLP74Pfc34gPTns8JFLLsD1FqAmj82Ex/9Jq5QoadCGVc4bWFyRYDsWffbSsTkY
	 jKLPnGRTkJB0TsWVkK5oe9h/dzCy2vJxOP+Rv2JT9HQSZqoMt0QlNRttwKQ4YxO1Deq26
	 m/ufffcsrJUUCKBngZw+Oo1y1uyNjJajQo+gCQcu0A76ho1MGqIQG/53MZRdZt5H30m0F
	 RpOWZTVpRtkfUlnJDrFZEp5MxiBdZx2BLSdesAL5XaRmmuUM5U4hrdNzGJZtwJ526L2RG
	 g7nlU49sOWcPjquwUsFaPwm89e6JtRwpM3n28O1fb2SNrBeoFEkpOrP6qfzQGc6xzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
	b=0IhtAb1l7pl9UrW8uM583dqqMCNP8zqoKItJPbcw5530iFEk5TT/+IISwUgYn7xWMgGA
	 XYcJ0zrMsOJKUNvHMNGnv8oF4PlmBAGfypsSvg5FcX+PKJHbLoO2X/XZedPjPuZgdSCgq
	 BlqLZEUG38458I4tx7C5YqcJLfb5Up1/g0qrXTuUT9lExd9kV/Q2YdZmEJunoBIfuiSng
	 eHUSdZbsjB3kJS+3ACrQdYAV6N1uVR55Xa63E3ELNp68xWr07576pRiDeIYaWZ2Uy0FkF
	 sMv6vkzX6KOdIyy271UrlIrzslhqLu4PK05k97NEBbj6rFWXMk9f7Km19MogBzdiwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51704606A322
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 09:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51704606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AhYG066515
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=; b=Gk5HEWLddCvbNRg7
	F6S5zLwNpdHTXhqPXDQmcJERUtxJqYTZUAYR6fq5CHz6tBAv4SJ6xTMeVq9IoDLv
	Cl8KwIP/HcQUs77bmYl3rdkIAtKb06OT4glPy21fmbwzkRk2ugW8va5jJfNvqwX8
	AjPG2fzQuYcTKtAz0BEFyC5XttO/tRzLYMXhLPOz5K1EAcplY0qK9fYNFPqDPF4m
	o0H0s+RujeC4NuqmQWGMC/k1Zbz5T3/sz/tM/2YhGPA0aPwTEGyTQn+GlER3WtW7
	k+BdkyCdgUDWbeIJIfpS7l1MOGDnLLKC16sGpRby+L1qTV66A1xdurbsDwIQsHiA
	f0rJXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdq4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 09:21:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso19963885a.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216117; x=1794820917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=F60+zxxb/bj2pVeqRV1me/rbvfq92afsvImtmwRm6LmytjYT4g+pioFFAPNINfGxcF
         L119daqN2FTs9R3V2AG/iynKeN0apoO/nYGmpCfRyt0Tt2hwB8BIWBQRVEGySExucd6E
         prn7wZUINpJ6fQ2ycN7Lp714swurmSM709Ap7C1jX9NMnPTqd8iVWHanbQWISTXY/DMe
         sXp2h3mUXBHd7IKqasoBh2i+jLPM6lcTQwVodlz9XlB01jtEtVw3WLNjV7Iie0WGPHV+
         bUB0qkhlMoXP8f5ELWPMzwh7Pahrz7lKkNXlfZ+AAD0bwmW9WESgCU2WLP2DuI9PpO8q
         eLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216117; x=1794820917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=sc2M7DRPR6JdYsDlzAVyldnCw8bWDuv98o9JaDzPt8X4KnbkcUAaQn1kOGg7ERkDUA
         CT9hBthrqhICnvv2UE9XOKS/QuHGqYHUHV4NlQXvCOZIdQrGKk6KM63hAUCEsHajS5F+
         etPkG5LCAiL+KhUQwwkp5RxyNl+nx6FPl1HuaMLRrL2S39WNwpMGI4NsVIMDX47VFNyh
         9nCFiGyqKdaHWyFbKCJ8j0KvujnTXkUgi/kNAaIEzkmA+rkaJU1WcfaytPqCQqe+dZ8N
         lO/YY9S6VqDWphoth8jagfpmspGc8788VjhtDuW1UmtJqHu/dxzU+elKikUTok2oXRDW
         k2qA==
X-Forwarded-Encrypted: i=1; AL+hErHbWq6RCljmIWH7MZE+skJWVTe+WRccqaaaeoMp4THY5uE6j9EjABDTn3AEM5jJu5HdpkBf8qpwb9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1X1cMLxd/S1M45fFWpysAjyw550zOSSu4VhxO8aQ3TrtvPGDf
	u+tmZxg6bL3PKwgye1FU3KgLZ7pEmWvhKoVZgD9e42AxESSr2tYEoquA62T7DojjQtCTltX13gx
	XIsCIVneTSxARH/Lh1whAmkrT5Ct4oQ7++0/8winwo4+AEzF3z7ybzfLPZLKTXr9rufNdPfY=
X-Gm-Gg: AYBFou045mTUT+1EORcI9qNjcRM3FbJ3NaQ3ww/fLlVdv6H7u3LQOUiEfwA7dIsoThn
	yn/WQper+GPNRW7C+E48oYbaca8fU/ioaHCQ6pTV11xJQk26LT3Zhw0hxM6AXzWBp62Xd8PKMLi
	D7rVwpOiKyPzyNVkVhrP6989+yq6eBMvSiPkXW7fCS60F3NCA/J66qX+/OGxDOqNU+CHqzwOCdp
	qZgJXrAiYBFjiV2pNAfz2Q6RMQDy/zqpTupZJyEIdtuUcnP9yLChTaxsr00/7lECYvtPJUQfW7s
	/0TcuVUFllX4e9oIz7micUwPd7AupH0eWdLbtdQgYUA/8Yd0udxsB2mjKyT+1GFM8FZOhl9WYqn
	3wbzo0Ewi/MDTburUxFdeSEgscJJjNH6zCT4kL81i7abYn4lqYkJRgeJ+es8xH+tiL82euQ==
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505025885a.4.1794216117419;
        Mon, 09 Nov 2026 01:21:57 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505023985a.4.1794216116974;
        Mon, 09 Nov 2026 01:21:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:21:55 -0800 (PST)
Message-ID: <01375dbc-e497-4ed6-97ad-93280969c54f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:21:53 +0100
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
Subject: Re: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mSTHx-iO7gT1-kL-H6eecB3H9MdBUKkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX3CHG7B4HsjVA
 IEWNJVqq4p2wWjj1WREmOLD1UFQQs54UNz7LwdbBeKwCmIWYUZu9EcA6Z7C7lCyV4U9+KJSjAgx
 ZAhbOJES2Wm4/fjF5JIAMVIAXI2yb26T8nQ9Wx96KHwKyoOULwVCHTms7qXoADiktXZrGZAYPGY
 iayR/v7usPEBdQD4FEj79HKR/AzJMw9Ta7SLGDIDFeFcGkW/D4B+48/mHlATEHDT15wu2YjA8n6
 hH9qvqjzxqqPuUx4rn1h3B6wGEnCi4Zwq56RcZxnTKsVU8lipBBEy6wQRPIqUC7u3J8wa6cMOTM
 twZdH65AY2Yqtiy6qoW94LmsqwI6Kug54fEscOONT6qgERaJXxsT1M8o4U8rov7Sy61ceoGiZBK
 z+UXtvSAWmN7ABQPtXi4UIqDaC6sufkPdr+WcBozNoxs8t7ZxW4YyZUcxnHFKD51LLlqC5yzubl
 qNWOuvZO2x8EmcCFDfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX/MWOrs4jq9wl
 zqKKgZwE9mc4Kk6amhbzew9pCrt3yGAAi0w0ScydjbPpVNMpPsvImFs9dXBnh6Wi6aX4kcznxyt
 aDSVQXxOf3qxASEzad5oFVeRiY8kUSM=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af190b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=0tVWl-7fB1VfZMg2ewEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mSTHx-iO7gT1-kL-H6eecB3H9MdBUKkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 2:00 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Note that this driver is configured in the Kconfig to be a tristate,
> the driver doesn't have suppress_bind_attrs set, and there is no __exit
> function defined. This change will add an __exit function that
> unregisters the platform driver.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
