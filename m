Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792602463;
	b=uXhte+NCjhbdzJIMKLM1eIO533QSTw50BigNfKWLmlx+NUcx+JhXJl92ps3MV9j2cg5U
	 mINmqb5XFTWPt8ZHB7p/Q40JqsVaQE1xwm/94d3LNpk2zhO7tJRTP5ctpvKcTYH56N38p
	 fCuIbPSxiaxMmoRewlg1DPY7Cdq5gwhmnCHU9GZdxd5Sz91+Uz1n6fmwi3eafGmAHUamq
	 3luk21i8KqXkatmpVCsBhj+zRpv9HGdIg+oP2fsPvLIaUT0h+7gzV3g3R9JIwt2ds4zAT
	 E0FD1uh7hC+IB+Z+LxzJZrEJTyTdseN6NGs20BnGPxLOVfl4fmLiGVysDNO3nXlFcyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602463;
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
	bh=6xd9TOLARqeRwA9tEyCqbb0GytuKjz5wJh3JtVB/u8Q=;
	b=MjaOjCeK8ymsWoiWpgd+VbeHjC3HKMfH1x8X1VEriqoSYeWRSyh7FBsZ2R3j0AC3P5az
	 mRPKwBnLmUQLfc2G9PdNIdH+i9BqnpFCaBMqjh+MgtvlRH0DWksiTHY+kzDaDgDzohyZ4
	 dBUsaLfdrHjr5v9Ncb6v/wR0zcYalqAQFCI4jMeOE05ABLbywqy6mJFTKclZoHgG4l29t
	 QSP5TZCdsiCVdgk0B1bhT9OfpLU6/INedfa6ONmVXLlAeDu3vOcCh87l2GyKWZYB73/yU
	 AASscn0HjX03Lzv1tknLQ3wkW4Pqu6w69cAi8h0p22BZwy2RJeMbI2oS8QivMZV9Htg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=US17rzDE;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Irukpz+C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF7606A31D;
	Wed, 21 Oct 2026 17:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=US17rzDE;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Irukpz+C
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFrkll2090578;
	Wed, 21 Oct 2026 12:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6xd9TOLARqeRwA9tEyCqbb0GytuKjz5wJh3JtVB/u
	8Q=; b=US17rzDEw1zRHifucBDQDsTZADhwwc5bvJREdP3Kl+dm+Q4kSmCQhsxEN
	jM3IvKwRkrPzcKYwJrWS95N2PUduXGK+zic84bAreKe6uFcEmFuauwzuy4CtR5PQ
	Z7iAGK1EYc4hiu4EupRq0Sd3neOND+IuIcwTuTesqh9gVLo6eL9zqcTDzYyNoFm7
	WzjYPgLH54Jdl5b/Pbr7S9HgIzvpoorUNz8FKV9kFPNwTI2LTp+7kOuLPfWGAgO2
	U1F25ORJlMEhvfqW/uH7jriFN/x5G/hRRuADivGoiAKRDN85//xVzUeFV6FiUXCJ
	Ru/mOu7WpQCOcfeKFWbGG1LPj85HA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaam3bk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 12:07:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+/JFJR+jo8MLAkypEunmgFZchbs+zPnBGpRYpmcuzrlvWN9QNwidRMilPA2AQZCs5pOKDp9Go2EPewwXmpjtsJe+Jlk/aOcubqMEs1I7BFsA77HGHXrdoEufk+fWNKgk6+XYoKAN6DfgWC0IlONSBT9yP//p/Dpja6yf0OCaqS6NGLPgOiSUL+BFCFSgmZ4LUtMOFlN/hOqPXm558XiOINHQ0qbR/+CA2UrFjZr/FtXYumju0S8UmTKrTLbAnQE/QnN1FUcCvxpQLDQDptPSyQh71F2ZbEtcP7nGZsiR6DeeG5YZw/Y0B/Zw2OU95qa+JebUnb3p/fp0VO4TIcRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xd9TOLARqeRwA9tEyCqbb0GytuKjz5wJh3JtVB/u8Q=;
 b=AcY2kTMSZ/0BRTx9c4pl4uyF18AwGeufIC4pEb9YKbSP1ZsLdjabuTW/owtxRMvwctCmMruokuoDG8cJ3Ul2chjLSJASyGYnCOdbmdagjX3j21Qhnmp6j6lyhD/a4rkA/q1OKSF6+93TbtunjEn6ZdjLO2S8r9J7yL7t9JHdOhPhLt5bppzM2xQN9C2LZMuvUATae+7n1Bw3HzXdROZQXg0mI57WUkee/ouNkSSAfGFzNozJPDh3Sbmeoa7GrhK+9qmfpzwFVK/i9V6BjagFM42eU1uw686TyI7kNgQVx68BgsyMGpPlS8mrXmVowkMf0LUm3FkbNlUDJ3RZ35dmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xd9TOLARqeRwA9tEyCqbb0GytuKjz5wJh3JtVB/u8Q=;
 b=Irukpz+C2nzhp0sUhLQxRqwFhh1H9464KuHYJmIJogfegi5CCnBxy04qAJgKUA7wy9hXdVPEuI+eNQtv/Ed8z2ngGj56UiiTPuL9/r/MDXnCQCDOnoPSaoolHlDJ9y5ISuetb1uASpOIuH9xO/4u3cdU8ffN63wSmHs6SX1sNVg=
Received: from DM6PR07CA0082.namprd07.prod.outlook.com (2603:10b6:5:337::15)
 by LV8PR10MB7728.namprd10.prod.outlook.com (2603:10b6:408:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:07:27 +0000
Received: from CH7PEPF0000001C.namprd21.prod.outlook.com
 (2603:10b6:5:337:cafe::45) by DM6PR07CA0082.outlook.office365.com
 (2603:10b6:5:337::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 17:07:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH7PEPF0000001C.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Wed, 21 Oct 2026 17:07:26 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:49 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 12:06:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 12:06:48 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LH6ddg3005964;
	Wed, 21 Oct 2026 12:06:45 -0500
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
Subject: Re: [PATCH v12 18/20] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20261007102936.2402427-19-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-19-s-adivi@ti.com>
Date: Wed, 21 Oct 2026 22:36:31 +0530
Message-ID: <179260239139.2416099.10892486007401823046.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF0000001C:EE_|LV8PR10MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0a04e9-5fe1-4297-fe61-08df2f95c81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|261021121427099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qmSjzSXXajhczW8iQGGJn+UQhdk0XLqC1LqgS9bj6KXch1sSUk9IWTLgqWfz84loBlcJCjLUOQvDDBo2utf4uYTdbks1KqC9glDzWV+UgapdKchxVMEPMYEKw78mw/LU5ZEVSZvF/9hjdWUFp8OT1e0a6L9/yDuDtn5IlKzb/qUo8DwRMzDYYneNTWmRnFFEy0L4PeuI8fCxggPV40C2oftZ8kuGAP0IIh2xx6+f00/v4+/i2KYXghN8IOi6F8BdCTO2Ue3BotieB9S97IkNaR5aii63muI8SCrwyRyi0jAYH8p9l4wZ2XSnO9WtP0pd/kcwnQnoU9MDqK75+VCBjeHLgUKt7ogDCA6VfR2TimJf0TzbeXrJOEfYoHLMHx2/AAsulitIuL9Ar3DSTIIfsm5TkDXpeP+JbIEvRoPUs49Ht1nX4hz0FJiQDH33X3jhtP5K0lkiIt4mvfHVY8xVyY8KCZUtJlYlqFlGBUtS33RPaahEF6FLXSHJaa14AmXY9wyjKkxJn3Sdg4uqhzLldE4benoiMVbFrES6AutGIR+GU5e/4nUrvhTuCml3Sfw1WhObu3eqeICZGND03iYod1USljXLVYvyopmVK+mDNYwQf3HSCRkimg463PNiZvfyxv98PnB0dLHLaMadHdYkggeVWppgwKTUu2Qt1ERE9C285TkAXP7avm2GkyYQrnZ6
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(261021121427099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zkni/RqyJnyrDKNX+geExRWxbIyPYD7auEF97LAaxGf60mQTkQNnuN9GgukwxWRgiWnTJkjbqf+bZ9sKDEAqDoohKtdBTdZ1Ff40IWVp0YAn+TUQFS04AZ0NTDWJMLHJI5CdrWKwicQCUhD4X5BRfWUlbDCEwT7/0ObcN/lDNHefyUIL8wUc2cmX5s2Xnsgv7C64z2LOdwBqJHjqMLxT/faaQZnXELdzCznilzAMCdUJbzTz1vg58LnD8njUecIp5Ujj/sO7bkwE8kc15W/1LjTt7xqvGuHTgQ5ZTJ9UpRr2vFnkIgyVzc46cMpQ/W3/KoAsYfhYNr8TJiF+yaKelQLl/53f//mgekwxCyeA7yhZn56kOnik4JGzqwwjIZWSt2ZKmnF5MB8LVJg22qQ9YjYImYI284wi4BGYeIgHufuLm+7wV8LEB0ICtLXwr5FB
X-Exchange-RoutingPolicyChecked:
	WhD+Qz2yLfA0QuEdJiSYWgzq9d7NKGUwBvSkM/CaPS16Dm28MbRQWSZ5N+RkDMPfG5EYzeYiK3fSwTvZfyn2seqJ2XL56rhNbrYsZ9//DEJR3aZRZ3kUNN4AmoaOn8MFMLP0kK2TB/mqEcarjyPEpVVJ75mu0cWxY07mauKPqpffhdNNZ9WBTS3cDdzE0DL3ui+xlyCMqABE5AdL1hi1oIsbEDCwB+LCuYQ8ga8MaKPzkFxZ4lPdL3Zz8ZGPRBkfYIF92CirV1MArcJo8vgYmy2f2akYwuk5jqlTX9BO46HNMIHLFaWYQwbnqg1dOpwJ2liKSf0J3YmW7HOKtaQIMA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:07:26.3420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0a04e9-5fe1-4297-fe61-08df2f95c81f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF0000001C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7728
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX+toNE1lWXjNi
 o410MYwI6Pm6Y9XAH2ua2yfxaArMLEt29CBJ0W1lz1UlMvsyh2C4aGTBrrP0Iq7o7bLH6IR9ReG
 Gr7lZb0Ckgxg0oTdsFuWrJkBtKtGybM=
X-Proofpoint-ORIG-GUID: TjvaRHyKA1y5sTcH2iv_SK1VpsAcbgt-
X-Proofpoint-GUID: TjvaRHyKA1y5sTcH2iv_SK1VpsAcbgt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXystniK+qCyRc
 XkA8/ZI38pE5mT65HBepptdg67uH7bsJJO1NUjpd/cCVbBuhbCKDYHNLSIpjNhQBCJ7hbn/Gsz2
 qIu2FbKgQoGmXszAsQJyckmf7j7nUwZ6ZRnCgKtGpXGapdEVQTNuRQcNaoB74bMxdeP83dDMqr9
 k19gP+/gX6brv4BSyM7aU+xtY8xlGaAwovaV9DjMhWqo7G9kfqt7FBMhgjaF0Hs6LOuYRVO/RNe
 PNy4vojuXfIPzjFTR3S/hfZzrqLqTTE27ZzszoLq/kPBfyCv/fKyOlpbIyDlpBAnK64FiFSLXzK
 mTRdk78+qVO0YP7uB1sQup6Ndl7IjQZGZsQ4KzDp/TtHnojsVCBImPuBUHaS09WPls4D7Ikv+kP
 OOrCNaqe9vi6xrloMdJ9E9G9Zu7Kq8Su2ShO89aW3fYVs0q4tfDL10TwAvtLV2Em9o1vCLl0wOi
 F6yy+RR1scDlBUJRFcw==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8f156 cx=c_pps
 a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=yLREh687bbE4FCYcsc8A:9
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

On Wed, 07 Oct 2026 15:58:59 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> The PKTDMA V2 is different than the existing PKTDMA supported by the
> k3-udma driver.
> 
> The changes in PKTDMA V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single
>   peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to
>   PEER registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> [...]

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh

