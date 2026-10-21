Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792602471;
	b=Pt8ewUWDJNpcNReRIlxw13xcrtYwSkWpZKeGRfjrERjvQNB5Yvx/uvDRDByjEHwmqVrV
	 dF8jFnNnP3fxsTNIiifdhhIBj8OqHI+FFr57K+/UIvXOqOXt3MBNImLhCJZqMbLTOnWUO
	 Wvi77VPZib5uQ4cFRun7VvSFiLMJuxJkcpdtnD0+5N/YqhukXcqxQl63eDmjO+pIapEXc
	 HTRxOIMWGBf1nGxGjb1j+hUdN22M3hG2NPL59hkhrCd5PhtoL5WDXk9l0pCggVRZdaO+1
	 QhBuh7pCU1tbT3z0qRDWENxOVvpV8VrgFxJCr2RnSIpRezIQtO47P9ddBlCsUufJIrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID:X-Mailer:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ulUpAcORojmDA3PbxZ5Fu3h5Sa/Hr2mnJuiH8JUKLlw=;
	b=Vp9G9eoOLzpWQSmtIakBuEtWtO6ywlLUipH9ZsD5x0OnQfUZPyIOiY8l8ES93qMCHmBf
	 XIgYM+dpk1g4T9UKK0zLXLC6H4BSUYRFTyg0VcegnLijopPJR5/4J9u2ABbkEhT7hqfVp
	 Mgt/SxaJaGN/l0LQxs1qDDTkucIn5LBbayPmmBzMQPDPo+AxlnfadDHPQDOk4VA2OHN1R
	 M/xDb8VlrnrBEKahRsgkPV3yfhKbU1JaSV5e9Uc3g84zCJc7copgFXeTQGZmo6mQPkram
	 3T+tWUV+eTxcaYUcKD8ek1dN+TJQq/2Ij+xVCHtA3EoSX0EEkGC+GoEoIgqnxij0SbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lREwqGZ6;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Vu2RydmT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E4606A31A;
	Wed, 21 Oct 2026 17:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lREwqGZ6;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Vu2RydmT
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFrkjl2090573;
	Wed, 21 Oct 2026 12:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ulUpAcORojmDA3PbxZ5Fu3h5Sa/Hr2mnJuiH8JUKL
	lw=; b=lREwqGZ6WM59jfdvtvE3GWHhKpWPz7Hjkf4eu9DThaTNB9EwxV649RnPn
	yDf44B4gKeOmjRHw0+6iy2yLvizd7+vTUI3vE1PZTHFC72dPYregkDgvwANIOX3U
	SYDruVUwsnxY+7moi/yzlBkm896/5bqVAsd2FZXUTaOZfNXHnDnjFoR9JM8H2T0X
	+ZySxshQURSJ5tVhBfc/rLoZVQuutyG+woJEwNgcavQdZhDTGYDUdQFYr3+vQikM
	Tk+9Su3fnOtI3d3EQ0wZXqu0YKonmiUkb+Geu2qcDl8Cm/sQwFpywzZANTSrYkef
	5Ul3PA50h/2pgkE2bRpaTpc1HHRpg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaam3cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 12:07:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4pjhFQEa7PRcHwmMWiQkqqJHA6s2TUAOfRn78b2kIJ4/ZfoJOTML4v1+6g5tW9UzbiqPEuwWS2CJFpkliUXydZjbS/35425OsgLW3Mqc81TF5EGRpksuYRDtotyckgkttClFpEnL8XXROh8HUp0bwPk03CzjSi2oDukg/kHTX8wAYFQ7DZkisN4BYNuJR4DvVkfzRnm8E5hZ+UdeDT80Yb8JEWCvxmvb/F+jZ+pbEddu8wE3qO9KGef21RS1Bsx0SYjF2Vi8HrAdTOtNmXKU97Iz7v33FI9YkAxseUfcBJPOwgq/PBZHd7rtifyOJ614ehRYmtaKrvFGqlFMMstpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulUpAcORojmDA3PbxZ5Fu3h5Sa/Hr2mnJuiH8JUKLlw=;
 b=sDnu8fxdGyOq2Rxc8e7qic4/FhUjWWGH4TAk2Ys1pETYpBVRkDPGW4jeh3PDJW5K9kLLZhtZTrOpzKtXWd9Ghslg4iQS2fCwAyjikqR46/cSfS0gYejMk5YIaVN56EXJIPVhUZ1Npq0yMFZZ2aUB8aPpPWjy3rHiQ1/BMJpKHaSZGfeIzWFwTcZHMwULkXxWB3Cv3RCRrFvhWY9qQEOsdlwkd4+AzCCho0jxEwArCcFg3wE8Z+ceyFOOdoEIs21HAyJYXCUfMpJMtvhHeLcg4oiuTON0ndJh7mMp8uoWdzE6bGpXO4dID1NoP9nZjXyL5SMOxJGFNV5Ek3wTtSRNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulUpAcORojmDA3PbxZ5Fu3h5Sa/Hr2mnJuiH8JUKLlw=;
 b=Vu2RydmTtV5t8nAQLEHh/3oIAzUDYaB6R223oH+6xKBQxOrtGWHfjJMS8tOIJUlLZwqb8lsIsxBV1TpzvvvJaXR4NZatKsOT0+cyXOSth+IagyMP9jOMFvAhbp/iuvEc1FYFSZEN5jsP/qfQV5xmd+3lkjjSETSFOc8mGEJidTY=
Received: from CY8PR11CA0039.namprd11.prod.outlook.com (2603:10b6:930:4a::27)
 by SA1PR10MB7854.namprd10.prod.outlook.com (2603:10b6:806:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:07:38 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:930:4a:cafe::72) by CY8PR11CA0039.outlook.office365.com
 (2603:10b6:930:4a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 17:07:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 17:07:37 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:53 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 12:06:53 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LH6ddh3005964;
	Wed, 21 Oct 2026 12:06:49 -0500
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
Subject: Re: [PATCH v12 19/20] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20261007102936.2402427-20-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-20-s-adivi@ti.com>
Date: Wed, 21 Oct 2026 22:36:31 +0530
Message-ID: <179260239140.2416099.12039418323425674341.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SA1PR10MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c15f56-0246-4663-94d2-08df2f95ceba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|10067099003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5vvqHTdqsbxtQSxCSMKP/cncD8/GVBIfRmveURXWJeKezxmaFbqTz+xnbJnZSNM4dXyJahFyZ6x0PzuFEySRkOFbQra2Pirz0cRKkJH4G2o0tBcljEuM7pAvQ9DKlzPZWpnntPcz0haP3w5k9KgSzR06h1afVJKhWTI6mo5k7Sd2ztDdsGTrPuAxDJWuT9hYZ3w7oVB9nZHTXz1Y2feJgAl4NjcIy3ChWne4AYvPfTUioM/bvZqYS7/4lArfowVv0G8hnN2ggl3sUGSrRa8W9dsQ2ievZMWw8vUNAbqpwwX7T2EeBDR23rIpcfSM7C2YtFEMSw3mXRqt54hZK9TYjkeHYQ04nEQW4ltrH6sgTINJJ/7SC/mK3wa3W8/loAE6i/O1E8mHlNvo/9mU5RHwW6dVGRK+EtMQL9Sa9uJvNQv6vuk254CsVujf2aSJ6j97Si6tMB/FZOGtNRv3f2CQu+i9tZQqJ8DejrWJYvbqMgX2m7Kkj8Ft1bgk1Wxh5hGeITjHhjdLMoHWpDzvJDj8tHqJ1VptsGVO9hVSCBZDCOYZpJSHP7IROcEstOKF4o5ZPpTeXsP2QKzw9i0DtrXmUjdqJYm4VBYhVuBvagCMGIC/vvlRfZODk9thMtsXAX+aU+rmAm9AHKJl3aQV5XRcE0Oj0kF+vxesDMmjwfHrBjihHf0som+ajW9Lh3HdcknQRYkxj1ogDTneBg+mrxH7/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tSf9TPjYpjnXB/aaVltzYb8n4oMowjodBy5M6JY98ITDD65nW9hYdSJex2gjIRu3QqVP2+a0B7bVEM75mpAMb4ygDsoeH5n1saU46ibP37fJNhQDLUHu3/oL6rooDX4ouQ8wL2owvh9hoBDWg0IMywW0fEScNYLTntHxPT5Xjvr9nOJfo/wAbgs0J4dmDBj9HtcgQnoQLn1jfN1N31WpQxPkr/HHAuzwGx0INfoA6KTLlvoDpEtzgV/otPeY2JXjTbYmbqOCxczokZB2UVWgIuy7MoPo1e05eh/VsOtcVpCSo5Pjf/LH1WItxPazpOAyzotkye32XGVlq51X+v5BFF7V69UIxtnvNEGxZPrLCntnG2jrbi9mZp+z3Q3n1+U9uZyCBJ4PugrKU95U4s5KX++YHFjj9IZ18Gmrcw2A3Esr7MTXQAE1h0fIr4lFZd9H
X-Exchange-RoutingPolicyChecked:
	TDJEYAbR9B7e23Y0IQYDJvNsZMmu92Y7PzfhNa5UJWH9xDwJEROEnD50lB7AT6Hr5mwOonJ1Jrs+MnGxTXA0sMEL8SmK4HmguXPACZV76Mc24vwP7KG5maPCL7fZAPcYJafH75xS4pYBggJHOrWA4bs8mny7hjGDwTa7gVFcwse7RkOoRlTzj6C670kcgIO0cvnaJaPC9uvqkJmwTQLUcQlMxdDqnpMakmgB5kxqYbxER38Iovhvi31/M44RizL6+9/wxhttcDU6fGxmCEBfu1k1U05r+BIUQcl+/aNqcpW1GjrFXw7XsbL7cfv1hIxYqlVBCCaIgnyllZEefVqmuA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:07:37.3815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c15f56-0246-4663-94d2-08df2f95ceba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7854
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXxIoEk+qeXBmp
 pjaR/l7FF7+cWgz9tK8jY/4PLWHUAG9vm0BPxcOLYX/KszJ9E4maYpKl0C/22ef2/oBgKUo8eVv
 Nl99mOIU/j3S03GKR2JVfssKYXj4H00=
X-Proofpoint-ORIG-GUID: KXk7P-U_9pLIZTvVurXTK1wDVv1GqX-H
X-Proofpoint-GUID: KXk7P-U_9pLIZTvVurXTK1wDVv1GqX-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX47TRTWe5bM1Q
 nM1KBP+jRXrlsil1MFuD+yQIccU+onw8MRMHwbts5uLyedBgzWXRAbCcUzyzCKhkMz8N0Dasqi8
 E9hrHGKEK1wAeVxyH5eSSfQsrYxYo7HvClf9Q2S86TuRzzPoNIwQeeIRmkFv6qY7gMMp2l/nVaJ
 bel382m+0OZQvAj7uP5xLvfI9WwQhp/9U2PRPwZzBlN0nXAdQQfg7jk65fqbN45pVkb3a2fyKYr
 Y3pDOQmIjnuLqwUNjupA6LZ0jhHihHS74OZpKNNzaARbTmSqWvQfWn2cWPSmwQTrNjlT1MJyHSs
 Dq40I4OEvtHPtz7gZ/t2kplawKDf0v5gXVny2waG5ZDFqLP4BDIQUoYlv/SO+N4NWYn6QMnw+mS
 uca1YdTDl6wMS8gw5yEi1Sa/L8XVUDXWmq2sTL4Q5Y2+up78co6up3TKOvva5vz8QMY5d0C4tll
 BukQh6c7OT3VFFxLVNw==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8f15e cx=c_pps
 a=fgNoY2FrYBgJmLE9YDNrYg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=XOT3N6iMOSpMs0DZTmQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Wed, 07 Oct 2026 15:59:00 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> Update glue layer to support PKTDMA V2 for non DMAengine users.
> 
> The updates include
> - Handling absence of TISCI
> - Direct IRQs
> - Autopair: Lack of PSIL pair.
> 
> [...]

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh

