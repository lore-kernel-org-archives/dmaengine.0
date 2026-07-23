Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447436494C
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813852; cv=none; b=Vka6SCOvrcdNSStlJ0zK5wBmL4G0wbVG9+hRi7kgzj8pxJhfDovmsu/e7A3JCk6lkAOqbXc04uguJ/20p3r64mVVZpnpxNmy8vnVsdKG18Az2+vDimVEeEAj/gLn3j5DacYpYiWrBd4AwgmrGjHmexj7C2bklmL2yBXBTN1IsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813852; c=relaxed/simple;
	bh=cX5RyP25LLZ1Jg13iKUkAoxbJ9vy0x/xpbeWmaWKPPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPGhCQ2mxHO9SNRJCbpvjjuXlTgD0s6UhpzoqgQD5MgIAscJjFHAbQcgttlQAoyHeOUhg6CWkPAEFrNqo9/m1/lMq/jMg7vXZ9OEWegUVBitAPg6iveki19Fz34JVRno9G9zDGaVX5M6pMy+amouBC43v6/bl3rjQmxs+VlfW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRGYiamr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdybesjm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRGYiamr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdybesjm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvqJq011937
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=; b=SRGYiamrXt0hgCk+
	WNnhRI8ZmDZgtZWVqW1gXz7GYyfDCE+Bwv0tbm94DH9CenByUSzUOayLRpZPEByi
	ObtqjIBg+Fu3WMkfH9hGp/12ej9FnHHk6rLTwHpn/Qbk2afuBbsKCsb46Ufqs9GV
	nNZgYZxcGHmZdOWD29oxeLnjVl2GV17+ivdpU1RqCKUdP6t1H9ZOZ2ZPl6QsvdOx
	3j8kW/6hckJUjTegwZ90PGymHVM207khRlCOcFcNgQ3CBR6ePJpeeNtscXxIjT8r
	bfPedFnEKprcj0f+eb/Z/HWS3P/7KK2RVvy+IPCsxDr4sHZoNWB6LjFWL7pFir/s
	MTqFIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhaa17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e57e56ce9so15539185a.3
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813830; x=1785418630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=cdybesjmOignIavR+if/HB41IMZVrYiCnY8YeIkNUcNk3Z9TkNAJtlRVYSxU8HkhPy
         3j0v0z6fEgVGifrpPQzTu+ZCSNgARgiS7whZvkDN2AftVkssoSWELnvPLvEVI7x82c8i
         /EoBA0ia2S376UkHeZKtIy34vzZ4/oM9avYVXQarIFgScFg/H/v9dNuEvVaibZBBF7gy
         asMNt6cPOXM//80mSFZULzfjOQgfYybvcjT5WSvzsQIs/hyjIzC+zAxnEMc0HHi0I8Qb
         kEFiuuJrsPhEa/r4FBAomMDOu9dTQvFdTRbMIBsRUkpG80v0aVIg16E1HGcQEmDvjY5r
         k3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813830; x=1785418630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=ndvZUnOmz+3h4N6ST22GFKc8+5/ZkYW1us4veTCv7V7ArhP9gXDOKpIbQS7V9O+bww
         PcLeVg46tr7233Qpoy7KL320IeYUZIGnu+Q2DXtLq53mchQXq4SOzZpOY4jMRlSbuxC+
         z3gnm1REllSExKUdst93r05U0C8j6N+Pa7qOkrwUqVVtAUDXRS1a9ohMiztmnkcZeRU8
         HKgV7+GdokGAlfOKKJFlgKB54nuVGDaHJieq7z1+Ucane88Bps6tEw/ld0bQl6xt4fA8
         RkrBN5xr9DPC5t1dLKmqjayza9Xq/9pkRhpavEC9Lmh4iA7MVxGhBSxPnFSxjLMCOdzQ
         yLtw==
X-Forwarded-Encrypted: i=1; AHgh+RqoncSUMWsFpmW5y1dcfz+azFyyqBYnwES36IkteiRM4KvEUBxXyxDFqKqE9fZjm7aQiWJUWq07B08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0ABmH7Uw0CyRM/l9HeSw5paXFaKKonLJ9j4orFkL/W1fkfuB
	x6RxBc0SqacPD5o84hlAm68BE41kdzVIEKdg3GhFYIWJkmJoeS7D/FR3g5ZudRcw8MVlhW9h0FU
	4UlVi9hAhgXeR1p2EDanhZ45oAwGRWQ/++JR91ZHOm3SK6OBFRGiWgCEZFdRXCZU=
X-Gm-Gg: AR+sD11l1LXHZNNNmUj/rCdyN9RPprwLU9Wn2ugO99verqcBngtbWZkHwTItBkgeDoP
	5cBhI2VmvYw+M3vXIGuctbIsGMnV9JYBjCr9+1fpTATmP28bqu7D4X0qvV/KvI69yHqUW/LGY7s
	kr14JK4IrNHx4GoBR0WKW0c3TGK0Ma7q5Pi4zSCRvDN73MCSIACGY2+miVcOQ+JUuiOLf5ehORn
	OfgGkdfIYw7gL4rnrSj5O1PNsV9FgDtjeTWFkvBJ+sO+TDgWAVTpF7C4h+2IXl3Bj+uYw9xzoWV
	6cXFFa3Wvu+LUiV91ZaB0/3xPWgCRuTcbmUVCiwemclOVdXJ7z+2vy9eA7142ylK2bTIC1GjVsC
	epr+Xe7KPYgp8+GrZB+/0WylS
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096761cf.8.1784813829674;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096461cf.8.1784813829187;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c4csm231706066b.63.2026.07.23.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:37:08 -0700 (PDT)
Message-ID: <fb8d3a44-0792-4420-aee6-e7559eb9ab70@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:37:05 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs
 to a remote VMID
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
 <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a621906 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jWf9ImQ_av2cyXA2soUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nKMDx_Bp4gz9nTZImrWsoqkxWg1IYZng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfX9HeOqHS9xGup
 l6n+YXKVU1KbrPsBpLRAbXfJCHspuDnkIxi+NTEmRDgNgiEt6o9U9rWekF55SXWyCGdub7SJigu
 MjP+bHCpzJGK8TgbhitTh+avYOu9vxx1r5RFniOVmn7kAODhzUt1c1GQpeLZ3T0jomuvMO5GJ4i
 9L7hdM9km1d9lecVury7O4Hnp5NBc4MpFSO76tf+/eopJQVbXtctP532y97nTmh3lsbusLYXwRg
 vNSXJEtWUUEfC8tV1jaRG1i2WHVp0K1Ewckj/7XNkINuITRgoaJINTSp2O80MkGJgXfbme3uAwc
 +fAMOQUehYwQxrmDjAi2b/E2mR7htB3YkbyswjQFkKwirt7Q1Ib4X1wF+2/d6nJfSVVWfKrUovy
 RlPmgNUWOlJw8s43B96ERlyvMRuXkrIWbivXqK4V7oblmHSNHkr+bI+yQGX8t17jSNZ0SzNwJ3m
 o9Ex/NGpC7uYkz45PFw==
X-Proofpoint-GUID: nKMDx_Bp4gz9nTZImrWsoqkxWg1IYZng
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfX0OAYiiCxE7Im
 VHsFilDuQgHBqmXxkrlsT/bFN5eIW2M6bxy+HzkhJH/3EkChmy73mhmwdWmp3ylaRurnHjPv49Z
 nhOdhwWuM+lddlgY3WvPCilEjaMMKDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230134

On 7/14/26 7:00 AM, Vishnu Santhosh wrote:
> On Qualcomm SoCs where the BAM is powered by a remote processor that
> enforces XPU access control (e.g. the mDSP on Shikra, VMID 43 / NAV),
> the BAM reads the descriptor FIFO as an AXI master under the remote
> execution environment. Without an SCM grant for the remote VMID, the
> first descriptor enqueue faults with an XPU violation.

[...]

> +	ret = of_property_read_u32_array(dev->of_node, "qcom,vmid",
> +					 bdev->vmids, n);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < n; i++) {
> +		if (bdev->vmids[i] == QCOM_SCM_VMID_HLOS) {
> +			dev_err(dev, "qcom,vmid must not include HLOS (%u)\n",
> +				QCOM_SCM_VMID_HLOS);
> +			return -EINVAL;
> +		}
> +	}

Please switch to device_property_ instead

[...]

> +static int bam_assign_fifo(struct bam_device *bdev, struct bam_chan *bchan)
> +{
> +	struct qcom_scm_vmperm *dst __free(kfree) = NULL;
> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	int i, ret;
> +
> +	if (!bdev->num_vmids)
> +		return 0;
> +
> +	dst = kcalloc(bdev->num_vmids + 1, sizeof(*dst), GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;

Please reshuffle this to follow

7c4c14ad3d8c ("tee: qcomtee: mem: Fix confusing cleanup.h syntax")

Konrad
