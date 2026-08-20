Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300A476CCE
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241331; cv=none; b=UsNSt7MxGmqthPEXGAef0jIyffcBadHNcAVROc66EumBVIIHddJQzwrzHi7vgOM+lJZj4l5ZI9vtXv2txrYv5B/rdwYgMWa8n6BRN95c9H666+okIXeokZQ6PqjblWKxln69cCVsk+e0RJ09ASqwt4+l3hUmVyLltaI2lFalubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241331; c=relaxed/simple;
	bh=6LNfdXvp91JEqYScMEtX7pxvv/zxFNt+D+VElmJlsmk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=JIKy0n2otD4olWEXXErZu3eDZKOnRh1CV0IkD8HwA0dO4MuC0PbzMrWZpZ75xyzQJzI2C8TrfKk/uQ5C1i31VMZbZZLlLND89AErzLysc7/QHmQvXmmJIQB8MChBLEM/tRMcb5U8l+JAjLPNewM2CW92Cv1etj7uRPMZt/QHe38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8D8cCca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoBqaceA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8D8cCca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoBqaceA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7Tb53464872
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 15:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6LNfdXvp91JEqYScMEtX7p
	xvv/zxFNt+D+VElmJlsmk=; b=R8D8cCcau3BTdQfoZStXlqbQs/IdbF3+s6RB6X
	ppfs6Z5n0UEnFfuIXOXdU/gYRKYYe4/p8PgggOyL9pPR4dgxsAXFjcLDns8JLAxQ
	7UeInTKeUyTVfc2d7uqzE4JuMxcNqtc/MI/WYUDXBmNYnOo8J439kllfqsQ8m/RF
	BlM7pLjUt9iB8Gr9EZmGiDK2z8q3Tb5GAOcuH95poMyDZ0f6SD91rLrch4rs2OA+
	p808TAueEK+Az88D0M3/eNx9YkXSiZC6GiqAZhcQbyVFENx19NpYVzHjlKqZCzk4
	WSzSo6UsDLyLzgNEuPRb/quNEltJXnlxPHxujrRWYeVQGXXg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0hf1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 15:55:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4071ad0d0so19223a34.2
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787241327; x=1787846127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6LNfdXvp91JEqYScMEtX7pxvv/zxFNt+D+VElmJlsmk=;
        b=EoBqaceALk6tS66PEmjhOeRqUzen9nHfO/FygF+lhNihuTyPL00nhJS6DvfhkIUDkY
         NhEpQiltwM4KY26ghj+yRXBF3C5thKp9h/wcRA1+xmGSSDV89v4dT8HvW11M7X+TDzj+
         9xodN3bCLEOez//eTvDPBeujhJzRY7VUx0qT3rEL8CUw75dl5iGZ4VrN20JdJ8XAThKP
         uGZdLSRjQ9pbUKw/ESQh8yD5tPXUVYbqaBbLOP0kImGA1S0af3selzgpxTsDppjlo3tZ
         yj8s/M7SnQ5u87yzhDLFbx7hvVPQgus35sh0kIiSG/CqDsDXdu4LwTYaboftiXv/YJ4b
         dWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787241327; x=1787846127;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LNfdXvp91JEqYScMEtX7pxvv/zxFNt+D+VElmJlsmk=;
        b=U+dSKfNcH60C3st0XbpTghB97qE3rrKIEl+ZtHJB+yQRgTd98tAb6T0VbjKoVRkYOG
         kR4fCoOWw6VXakK4xf8JYd3luG8n+AqXkLN7SH8M+yOypXD2oJDDh5aVlgcgi6I9p3Zs
         lf95bW+6HVbSbMSClaNyUUGcXVN8nr7f4PTWKZHtRHLYk7c2qE/c9LJWgdP4b5yvNqzr
         00Gaqlqz0ESYhv7GDMx/sYKNTbwMXfKC/mSJh4StYKpfg6anvg33vEfKKk7Nlu8GJcdm
         xRNDLikk97U3zP/QBQVfTKw7fD9fLC323mfAtlttf5qxq06OcVA6eej8xCi6Hj0Y45CA
         OVNA==
X-Gm-Message-State: AOJu0YwfoBbucu3PKp9uXQYiu0YFayTcwHbiJHOR3jh0+gP5zDtGTZP4
	i6LsyWji+S//BO4YscsDxFg10AwcduImvohE68HSVxtncm4Lqu3E/nRJ4btofXIwjqJjmlRVggg
	UFWftUG9g6VkjYUqxlPpXie2ZOJ9vJjoaAoW2k1wbkvmqqGCfTy20bocC7k8bKa+eMbn5d1Q=
X-Gm-Gg: AR+sD125wxgv5QBByjlgy5NWxf2q9EY8UdM9YqxsD/vdmvY5aufr/jvzyVXwNV+xeBf
	yjMDftHCBwNdv/iFl9i8gAIKGqnUD04CQjrUOkakjdrVGqdoNUMLYrbnEIP5ifII8b+xImpNkeg
	e5VBW3kRoT76qmD3CFnJqaEdz0cL+ciPAMqpoO+abL6kCA06KOvLzEKePYFPEJgJ7j9CS2A053H
	VmqRebKBeoIiFQCWqCvOwdJcO6VDhQpbPZ/s8H2DPW3zOHHAEZBICU15RjzDhfWJQRh9GhOWxAR
	+TtvTzlt1hhGpin8Z3OFmx53e2bAn/Amy5xn/QRoOPmJV9MrwKFTogcReQon5SwE2+9zuy1fDZR
	PgvVIJv/o4JgBhzo2tfldyU91EzUa
X-Received: by 2002:a05:6820:190d:b0:6a3:8b32:3ecf with SMTP id 006d021491bc7-6b13c38541cmr13438435eaf.12.1787241327332;
        Thu, 20 Aug 2026 08:55:27 -0700 (PDT)
X-Received: by 2002:a05:6820:190d:b0:6a3:8b32:3ecf with SMTP id 006d021491bc7-6b13c38541cmr13438372eaf.12.1787241326874;
        Thu, 20 Aug 2026 08:55:26 -0700 (PDT)
Received: from [192.168.1.249] ([183.82.0.121])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632aae372esm1943523fac.17.2026.08.20.08.55.25
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 08:55:26 -0700 (PDT)
Message-ID: <390a3985-c9a5-4ef3-b0c7-174178e391e6@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 21:25:23 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dmaengine@vger.kernel.org
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: subscribe to dma engine list
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CFqTaeMBouFQWmiS3gk-Y9_ThqQCib0e
X-Proofpoint-ORIG-GUID: CFqTaeMBouFQWmiS3gk-Y9_ThqQCib0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExOSBTYWx0ZWRfX7BPnpLxsOP4N
 bRKQDHxTmMntp1rmFPexQ4upwHIlgZZwM+MW3vSmya0O+eh+UqpKepXrMitIG7q401t7j6qyfqJ
 ODHDuKgzTN/gNWQFelnaPCFhLlCBWmfFA/hbKn5CScCfO+iIRsfh5bpMpRX9DVN4UKTAmd/UWlg
 3wl4O7YezKFMqoWk39zefflwaOgn/F/1pDYACSpFZOkPtPFn8jpI97ABQisnGWbPJCBbJ93WwB4
 b7JGqpF87YZS/GxtEfRVwG42jly/mzpu//QnrKkLEbfL8nL5K2zv0HqIdUNOMj7DYseLlrb+OnM
 xNCob71FuNhXc3tYY18B5gxUuOlGJIDimjusAWZAAi0Wk2oynOAcUs9WPYh+ADwCdfa/2KXq9c2
 SJNNhuNONALmLy0dO/4L34O5tky3jRO8g18oqSA5jAN8e0vy9yxCSV0P6SEFA6698DyQfJ7i78e
 gNQBbiQoTVNOFvswxZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExOSBTYWx0ZWRfX9i06X5nacZhm
 GKuAz3IpUrXyWgts1ut/C0aio1gxiCN53pbPy62uWuft3CZJmYgVaNOrUPbaISmjdpEH58BGlSN
 IvfqKv4BP3jmgW7kihK83/H4CsmX1lg=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a872370 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Geb3YKDF9lxA8ikD6v4tiQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sDE6lZovMVp1KhqPsCUA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200119

subscribe dmaengine
