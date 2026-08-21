Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1732EEE65
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315610; cv=none; b=AGhI7RGN88wIVe1cJYxYQtT0VGzkVs4FP7Dr5+dIqcc98f1/1drgLqyIQgVTHGDF+ATZNBZzw28hhzvisvsWiLjCHHWMQkQ280/ibtrtpkZPIcXjFwQk9NNps9h1eYOmwMdAEThqzbn4+P8LqDY1/pAdBB4ycsKbOqr8X9hiajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315610; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=tH9Y2/SzgLoXEFPWEVvFjbGWUrMP8WFY0gdpD9GzX/0ID++l3uaSoTijBUwnAiwd/X2otLFpGm4gG8A7lqinXpiVunUOn0nXWi3KFKkjv/EhOjUhreNAvxBQm18YB3Zr90zEFW1ORd7ytXdCnslSbtDB4tjtvs9yZ0PP1v2MkqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5qzh4oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SID2SG74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5qzh4oC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SID2SG74"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LBq2tr2128525
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 12:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5
	NMpJWZG3hSuFU=; b=F5qzh4oCCVpSjmsdqwc0685vledu8RQMAlcMDMLm40ixFQ
	MC9aiPePtyfPyXPQO8DDssV4saCFX353PcwYFBtiN8fZrBsWDQVmp0xq7GwKUDuO
	UrJltBBoepbdwvt0UNt/hsNbY4efcnDU1fT1gmIjESNlyEkU35AA4SztBKEf76K0
	cUbnfZL600QJKFbF72CvIioRcfkc+0tJ1/7bvRxR5HIVeMzXw4+k8mv84u2Sxbxz
	LIDvKVjuH3cf3j/WhySxEdptpK1ztucFJryHl1Q+QhfiFJ4hmhGssbnGx4eItsmS
	hnuJI/KePBzntvX75NxG59ui4qp6m7MKOgJG6XiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9x0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 12:33:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so891835a91.0
        for <dmaengine@vger.kernel.org>; Fri, 21 Aug 2026 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787315602; x=1787920402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=SID2SG74Q14kQOnTbhSeayqniup4JF0gWseR3R3GO63nc4B0dpE5YfDTnPjhinA/u6
         G45Sb/8CP8Y5laPzJKwP9D4Eo0E1CPthZIAMBSag7Oj7CEaj6dlhntaENUqdnzH0uS7k
         MJcR9NK3N0q3BUSri/HDXEPEXRylnimtqQT+QVF0y7ZnpkR0H/z2dYIZfRB+XAz0EX4a
         arAJBavq519odqt7DLg8Pv92pcpFrZH+Ee1wVpfmC7e6BELJ1UkRVLdpVqjBzSDMGKW4
         ECzuALU61xFLoB7DZP2mbcqxGMswHdoIwXvDXUtZg66idHB3CxlELT9VUDV9Dfrgqpf2
         BXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315602; x=1787920402;
        h=content-transfer-encoding:content-type:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=kjGWqBuXFRNAxDFgZJL1bzSk1RXjbMvULmn7QRjdO1MHyU/LjFFosDSabzqo+sH40f
         6tMRK93g2zK57Fho8Zi2AlK4hS46KJpz4whV/Gm0x5to3J29SvAhZ+lTa7HawzqrTN5q
         U7bLFUDqWC7qTbtIrM+v/YBEWqNtl+7Cfe3mHXTZCrr3CVaHNx360QWAKyXV3wP2Njq6
         cCdwVRVJAPG508vPlmDEIdXwx2F75luvVu4YLm6Vn9DLM4e4raNyvoS/wT+Rv1PncwyB
         Q+H1PxGkRePQHNoXDBz3hu+Iq07ZmEQ1RQeqvW4nr/bBQjDbx1jYhjr1ij+phyE9AoSF
         eQvA==
X-Gm-Message-State: AFuF++nnfNsBoEW3XpVt6gdGz7a6/da5RJ537Fwf1aehjyBTSViTi0yr
	xktp/HK3W0AUkf2mzW+Ml7RL2uyx3jX8mfGqKwY9i70yoOgqJX7t851EnDwZYPOsyNTX/n5hi8u
	x4tTZv6w2q2GFXbEIn9HQk2B4jABJKn0yfa/ik6JgUONnVtYcPy7lFXqVenMp0JGWdovejzw=
X-Gm-Gg: AR+sD12eBfy+s5ctsH/+//bTmeEFSHOJ+ft33VIgjF/nfpsfYaZQdEtA7Cs1EikOXGj
	YdEJcViAFUIiVYW2cKlcuZT3/AJdsYmgK1ND7I1pTnjLuEWTzueDfJdPLG8xFaJTK5AgaS7Jfc4
	FdNFXDmR9X8ckmkYuXXCL7xidVC6UmiEmEqFA3PEWjqs/LCXItpbnXCfd/0xLXYhzu9My0Ix/xv
	JG7NAniCIePjPRK/xWPOI5yogko8ZUatjdMHGWWlvSXJw541du2kxNiNzYOSCrlzJK6G9q5kwi4
	q4ZrFJrd0qgyCChNToxyUvx/SKcDzheXPTD/SI/IQltVaOEhB6SjWPK2QUkOXOjdGNmhp8l1x56
	DlN+EKXtIJQ/KW3rv2LuGuiuGJyBTOCg=
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr5679325a91.4.1787315601657;
        Fri, 21 Aug 2026 05:33:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr5679167a91.4.1787315600584;
        Fri, 21 Aug 2026 05:33:20 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c42076b6sm3079372a91.0.2026.08.21.05.33.19
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 05:33:20 -0700 (PDT)
Message-ID: <c7f98f27-881f-4e16-a52b-c6e96c682237@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 18:03:17 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dmaengine@vger.kernel.org
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5NiBTYWx0ZWRfXwE05jDcNBzT2
 cjZG9evd428TyyJAMximLXUg7x8rJ2jb6Zzy467frSSL0KS5RV5UoVafUlj+1a9JdlARmvkOWHL
 eZYEjTvVXIH108BsTGNOVWswQgKh7coz2Z9vWvcyM4RvXgqJatrBjxFjX8/qoGMxlsXmoKm6I1l
 TU2FqKWqJUlA2ptjefDFe/0AR8WZESpAyuaHlvkR8nxkjWSFzgG5j/EwoV/Ntsk3eoWE1lME9YD
 rrVJ185f5oLQRIscKP8vZkMFqMG4LxECRepfeWvvlNpAH0ETdHQsx73S6ng0tozLg7ZwW5zERUv
 D7cDdmJej1sb51uFHyKq8cbN3Bo8LYX/eY/8lvzlLmtbUYWfs+g/MccU+K0kM0VefrjLo2IUhLa
 xBLRiPzsSSI8ARgqAVS/nHxler6qJMzzht+NhEqkHmFMGKTprvOOrFpznQxEP7LqgQzOegNrjoo
 131VmNL6VmwHsFlPeQw==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a884592 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jmC0iq_vPAAjV9T4zOdMyuBAdyOuiiJl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5NiBTYWx0ZWRfXxLMTNpOP2qDQ
 hbhRKwOq9+GJERtUmWYDarM80kIZYIwbTnraVPgfDocpv3Nk/U2gocqLwH2CbtXA/zfQWAWcYId
 EWJSPT+BFNzqz/hU0322zEL9c70cT/A=
X-Proofpoint-ORIG-GUID: jmC0iq_vPAAjV9T4zOdMyuBAdyOuiiJl
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210096

