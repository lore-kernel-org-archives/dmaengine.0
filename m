Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737359;
	b=EUq6aVQLef9q9nm6o7uwRDOPEtm6PE1woUGyeupZwwU3lOCLdbvlotKsA01VJ/IPtC4l
	 RM2ksOlCQPzrJ/NRKEMEy1ApyoVUJahtn0BOIIKPpUvxpVaodZuu29by4kRb0YzGfojEG
	 3TX6lyr0LX0tk++Q3T8j+H90Bc6MHSdrq1U7xSKzMb1waY9oZsd2mlg2xS5XMz2aaJt9Z
	 DfhZjqkc3DZ4GZ4jYM5yMNDts/POV0gz2WKCMKWyvUW65Qmv5yGLHvex9JLCoIhFhzpl6
	 mhtOseWcGOMqI34ujofIAjfIlG0oHx5JB4bYiDHpkLcXBmob5BVCffKClkq4o2afnhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
	b=4rKKTm+ew3CyZOSo/ByHE2FIidTA8dm4Lk+0ZOBX3xN5oPrGq3Nl7DDgdk+Lk9iB83as
	 oOipZqGnjII3Ksn/KBKmdo6sBJPyaBzbs+Uu96P1FvLs1YSb9Efm68AXG4tajyLgmIIB7
	 27mSQfIFwLK9rYYNAsTs2hGJswT3yZn4TnP5oeMs/g9Svfh2i3nbns8ShX9icT2s4zYBv
	 7MVI2ljWvPjWwxXRh+Ti2oqucbc+wf2Po5OTeXcjcGF3vdYk90jHOQipzFCPgCVVJle0x
	 fzsZccgg/To/kdHdBScGUun0POKQP3r/lMSltZJUoUEkqqctQg/uyRJah6Ny0yY9TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD925606A320
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD925606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FFbm1869602
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=; b=aSfuX03YfS+94pFv
	7plch/SN3ozY0zca1mXWGPSdS3DaJmoA1JcxwoAjTeqEilifoP+0UMqWYms5L/5I
	jEfZw/bSM+bto/WuOO4pLtU4erDqhrHw/3Fgt/u6tseicUkIIYM1lK4hcLG2fupW
	nL1ZUtv7mrFzGSpywQSImgTozvUv9WFf4bFPaGpZQ/ghpa+wtmi+YZaZLLETO+JQ
	3XOzidkr68huM+J7biySdI4ZK4/MLMwiA+/cZTAYi8xMPmv+aliXo4WLqt93C9sa
	YlWhXgt551LC/VfgAcSsBAME/8fwaugdlWCyPUepAu8LytVA6mBpk1bT1/Cidpd0
	3LF6fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjaac8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso5323015ad.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737357; x=1793342157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=DCCE71CkyvVIO+hC5WDyWevOShxzDY5Tc8FjJClpH5ulJ4IZjggRDF5fHPWFx46n1U
         fd8IgTqaEIb/jM6j2AbF9zx+jk30aYybvRFYC1sRkQOBrXp4OEplv1tpzsQOcpP/GOeV
         k3k8pS+slBMyETVcvVQVgBvWJRguWDd2Oyztt4jI+CpeCfG3ucRm4OSi5+/8e0E6q39S
         m9q1ulvwY/KdNRcgAbwy9a7M6olvqyIond/0em60VrXRfQBz4hWfp3Rz/+7scvqxl8L8
         yNWp6wW5LEe4uZ02GxK2munvxo91T/YYNJv6yihHiJCJEASZUfWxVrq9tO4TvFk4hjtp
         xuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737357; x=1793342157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=LxHHPzulNAppS5sQSExcZD3r5y/XkP+HhktvpH79z9dqEKnAsyZaN2LwUP3UBAfN4x
         WimdRsnjZszXcWNZbMlm+hb0lhAxXm08vnoVOZqIXoRBrPQ/sX1gJyzQJVe9FsULK8aY
         AQFuA1bCs7KSylunSDzgPHNjOx3IWb6EOVDHMfJrO4HMgOyLzI3qCDTOxQZPjRJIv5Du
         xui9NC8yfriRAQZsYB8MjV3NG4GGm/CXz+FD/EsDCod6mPUx4rvnSFpOqH7TE3Ts0Deq
         IF0Mi0QlXgJBqRXKia32fX59F04JGP6UvqrOMm5J5vuWRRPv084mZrxbp/Z35THri7Kc
         7SWg==
X-Forwarded-Encrypted: i=1; AKwUvBylBNypPda5oki73avVkywa9yQCT8ptEQ9gWjoJIjtVCFE35obKBNqqUOPPWDlw/wlTZDp5r3kPFcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr1o+kCoLVfSJXETiE5XnZCztG59+3NJ+9Su9z+7dsHfKuzTQi
	iN+uluJ7U81F8TA0rAnKSH8VnBSKZi1ryvveJCg4zDpazBJJ9PEVdAMi5D40yMO/e1iw/Nlt2pj
	I3z2cE40AawiRDh7PfwLeQnug+e+JlCJ9BtLtUKMs0Ggy+u/wlcXnaIxeT+XRMBdF6+Y/ssg=
X-Gm-Gg: AYBFou29UEEEVnxnwDZabOP8hKVfYBfVEUNeWdrEffzO0VcEpW8iYsmTJF+SrEHZuN7
	aoTlYYKk9JjPFOr8zG3GTzudmeumSCDa1aafXsUbiLdlH2Wmrg+F43PzWGpLbm7lLhQ2YCmT5TD
	HMwoajGH8sMPw8YCTERMWYHi6SAhNDQrGJ2Hwz8xd7B3gJ8mzTA0MF8wQ7EewVUGDAvTCO2S3/b
	w5YV6q2CYq/f3B8NvGW7tIWUTIw8tq7thbcJfu4nrw9XvhsRK+XHZUv5MLHscpBmA6u800q5FNv
	az3qzz2ONgwPXufLZQl5H5nkqRmh98g42jPlETpcNd8KL0LLaHpgRW8rr3lPBueWP0v1iCwF4SZ
	BiokS8gwMMdG6LCGQUdEJ2s/t6MMcvMKM
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960735ad.29.1792737356543;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960525ad.29.1792737356123;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b343d1esm6107115ad.23.2026.10.22.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:35:55 -0700 (PDT)
Message-ID: <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:50 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261022140139.GA952798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OnncAxO1kNbTqthwhosS6c7iOjCgrpKm
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb004d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9ErL3UT9lRrTfhtYDI4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=e2CUPOnPG4QKp8I52DXD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX8k+1Y2JYnq8p
 ykJ40UuWmkTyKD3bS1kpfDyJLsEdxZupjfNeaWg0Ys67j9QrByllzAqTpp4p89jbJh57LvUNrkR
 FgEEAXbzQKH7n+ujMjOL6sLNdvYBbMI=
X-Proofpoint-ORIG-GUID: OnncAxO1kNbTqthwhosS6c7iOjCgrpKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX0E6Xw3gqBdoi
 5q+etJD+XbGUF7RE1lqnFum4Hxs9DU2bXthsiNYcddQ3vLOiDl+lmrWz/0147dsDBhyl5TZnTm0
 eVEXjVcBJqfJNpHtDU7BNze//QA4mHcih41igNTxFlZWKt7Zve2DibL+5Dpn/2xE8bjNiJgEoec
 vj15UwCa/n83WQDvzpamEvm5u4ND/pveUv6PC7h1QgJD+lM76ij5SYZ7t0SYVIIZpS7d71C3QHk
 e2PrXPvWS6MkGGYSyWP36M3l0oK7aIStsPmOixDBqnzAgw2FqJm/XFHuED5GXRn+jr3zoqQiQFZ
 EFRsYhNAkbxUzscGx7usmuMsT+4NlgxbkQpIdzQGsmP/EI7VPScAHHMnpQGZ5Sh0cpGYpOGj1pJ
 PRScdqkDpAy9ObaB5loPRXzg8c1YzSBkbtfnDk37s7MxLDXVZp/OiMzHSQqiTYboyHyjeRKMtF5
 XAk5k4oRIClricoRnHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230026


On 22-10-2026 07:31 pm, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>> arbitrary host memory.
>>
>> Add an optional memory-region property to constrain DMA allocations made
>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>> for the remote execution environment are managed separately.
> dma-ranges is normally how address restrictions for a device are
> defined. Why can't that be used here?
>
> Rob

The constraint here is access permission, not addressing. The modem can
only access a carve-out that is assigned to it through SCM.

The soc bus on Shikra already has an identity dma-ranges covering
64GB [1], so there is no addressing limitation to describe. dma-ranges
does not reserve memory, so allocations would still come from the
general page allocator, outside the assigned carve-out, and modem
accesses to them trigger an XPU violation. It also applies to every
device on the bus.

The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
provides a dedicated, per-device region, which is the setup it was
introduced for no IOMMU, with firmware restricting device accesses to
specific regions [2]. Stephan suggested this approach on v1 of the
BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
same pool, so a single assignment covers both the descriptor FIFOs and
the data buffers.

[1] https://elixir.bootlin.com/linux/v7.3-rc7/source/arch/arm64/boot/dts/qcom/shikra.dtsi#L508
[2] https://lwn.net/Articles/841916/
[3] https://lore.kernel.org/all/an27PVxkCpD09xSR@linaro.org/

Vishnu

