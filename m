Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9C412BF1;
	Mon, 10 Aug 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374914; cv=fail; b=qAvPH97/e8iK5kua7f5qgzSrogHkkGVZqRGMNFX3HUyaim4AbJQoRiY/GlWR3zBVdeaLyaKtQxDgMsB6LHVQGP9oKb5btl51qiA5LugCsY6hYPUHmN822gbju7vXe3DQjf1k+10J0NjQYVr48QNJh1SAf0LHZfEAP/dClqFM8so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374914; c=relaxed/simple;
	bh=XEMiOpRcgh2KopvJuF4HuRB4XX5p6KgVkd9OeVvfRy4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAytIxu/w5B/xHyFqnOQkZ3spF6P6yAbVLigrBXhOqNAFdlTnVzyRDehE1YXVY2cNs5+BKTNaW9+TwOraWyKVc6zODh+7uY/arJS++7z+fGHcZoVdLbC4cPtR7ye38bE9aRlWrp0fnWnkG9fkyprAMigejoECHd8kS9BUnuKBqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lUWAPJXd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=syF4mUjH; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lUWAPJXd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="syF4mUjH"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUiob2888775;
	Mon, 10 Aug 2026 10:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rU5xCF2SPS3Q8XYqqdL66YHiHShAB9hjbLa/JHAbg
	uE=; b=lUWAPJXdis7l2/csXqPZLaaNJ8PnJhms+vmx/9N4IjxUZJQQn4EGEZkjS
	oMscKcyCa/Twv/X37EKXD7huxJwexrYECU6sdLA1yfrtsGLCpwkFBjhJmyCxroq9
	/S6+qD/1QJLxB2JEN93aRxayPsmxit9wBsoVAmI/TKkC8qeS1wT4G+VystyxCJub
	6p2tekhiiVHBpJ8k4gi1ZzCG5PbOtAr09tKIrhjhUzIpDp4L5yPGtgsjqoLixgh5
	VCZcLGFVPYi3ziUxt/gJoIWhtWU0xLuJv8qeyW6xfP1noTp/fgIus2c3kzw5r6sK
	MsoyGLindZOOgOoQIoQRAN4kgvZWg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmsh31-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c31WlG5futjSjMo1qPe9+XRCb0WllrCnbCSBr/jIPVEqy3TEsSBnj29UuLuG+uircCPlvn4ilozQ9+ph45Ut6SaQAcfW4kvq+u0ACqwN93nCWQil5nx4nPOUy7hNxSjUOwA/xvJ02HMlNpF3JqXfYL9aR7MnV3ztUsWcS1amCa74xQa1QZr7fdtVqMBE6XQ74GonLYE0sDbUYDgRvwdjPGEWVYKJyzsfKbEiTmO5ZrqLpQ0GLoVq1fv1zFUYSdSi/hBRPcDNYKEee/3CCGMeVMWDJEWB8VUVQyLwqJr914TCoQfvdkfA6rDiI4nZT6NPA+L0MSzRE6dUYDuBdOR2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU5xCF2SPS3Q8XYqqdL66YHiHShAB9hjbLa/JHAbguE=;
 b=cRJCgVb6OONE02QaxNm5t9IVmlCBukjvU6WxdCsK6uwgWT6+0vaS67maarA8ZilmHc3uQZhrTzXkXsWhKfIwdxcWC5Q1z468Jg2PyoBZX8xbyFcNo7Nf84X6s0MfS56Y9/yujY1sFpwU+tJttLSP7Un/ZreI82fk4IXnOaT8Uk7Q1OUQ+F5ULoQ6sPdjTz8RIBoluNwNtOjTKyMI4fpEtwktcAE8DixwU7OOaghyM5f5HE2WrICcWgQ2Sc5rw3H/o1BLv/mZvNElCPAdp1glt2YnBYF9Z8EjEHP9sSr76LSfJqlNX4b0Bfeq7kpduNnpGY/oy9Vn2gtmT6JMPvTvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU5xCF2SPS3Q8XYqqdL66YHiHShAB9hjbLa/JHAbguE=;
 b=syF4mUjHKN01I/ANgjRX7cvhCk9eiOs+MDUAJ/UHVvDRQCXHb7OI0bnZGZvdk5IwuRrplNp1etsXZ5HYV2oYnRZ+MA1IYiRA35EjN6eYz9Hj80Y10YVXlnU16xMgmNpbHKp9ArAFbfNaINqOG7HJX3/j/oVN8djPv7xcXDmVSBw=
Received: from SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14)
 by BN0PR10MB4872.namprd10.prod.outlook.com (2603:10b6:408:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:00 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::cb) by SJ0PR13CA0129.outlook.office365.com
 (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 15:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:59 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:58 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:58 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW12648613;
	Mon, 10 Aug 2026 10:14:54 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 06/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Mon, 10 Aug 2026 20:44:00 +0530
Message-ID: <20260810151423.1948224-7-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|BN0PR10MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 522641e9-2bb2-4b5f-b528-08def6f224f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|921020|22082099003|18002099003|56012099006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	uHuQBrpRqEPHzQ9b4xVEHS4i9zbf12TOJF29ETsH8fYpCpOIzG2DNpf8Uzn2UP8eeQhanD1qt1oZ977lD/UOJYbE59gQj0zLNNvWEPSPDUGahbdJCuPBGIHtYfl52jFWyH62xzz1P5+EN/aQ/QLXGqtEWjFpExtsyTXn5TYJMOaH9jw+/SPeFakBnSl8GGflfdG9ZIwL1ZS3XL2n937PbnmtaOxsggtkJpRArTxyvNqSOnbFGETAbnRmDxKVUUhfo6cUmDJjujIYIHk1nTPxGEca5QEnFzDCUksLuoF+ivXAF25VbLRpI82ogP4iOSCF6PSfX5Ww2VHOfiL7wZ9PlPq7HpBpmkzqVYN+RUq6YFA8Hr7lQDInW6YRhfTpOmlfoa+eEEjoeVp8tQAcVVARLb4i0S4pJ/Uns8qmKLWU7efDMsUz+8ftiMsWZ7XJhkeP5LdyyxcSHMd0i3GspM8MMz7xH8zEnK81fBMjW1xNQxGg6gyi5wlt+en8yBzXJpHaXBc0Oql4wC2DAC2YvNcR6xLRON3vSpS81kOGXbieOAl01yoM8OoRA1A66VR61fkEMBLLyZEAzm17FDUddKzzx7MxyHk+qeBYVkixkc6WvSfhkZ2GAJHm4yuVeuxJ4CxK/R55DH6YvA7vhk0R6NG0/GgYb30G6SSA92S1iqxRtr6dIrIuYOLqG8jgZKCuMvWm/E+2JXXhXxNSuHrssH8QLy201IOfJqoUj43XCSar0oL/ZVO1vkVxG/kcu8iCmCPF
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d4mOXbZ62K7sYfLaMQZAw6peKdWhQBOe3/PyqsHL0/130QQLjo1qYja6NIwpu/v/uOw2f14fSTfUqaFCBihtA5yEXU8yfH+Wv2ISOxwFtUYt4kbvs0HokFElLNk7pADxU4Sad7dq0L3o3qEsl2OoldOWxLCiwyi2wg6CgHy13/oueW/bEgWI443pWHMqpSz455GS3cVULrK97IOT08mbu5gyTnVeyTlP7jxROt8pi2/5mlP757jgTun/rEj+MECaAYsiHi7ob+CworEb/g99t/sZPbNUfkyEBNUGH2mxfWvwbbBG2cB/a3oiA15sYUepalrGlGM4+Nyo9rX+5t0aASI2E4+5hBr8zccUOtz09xWEt8Lz7CjPsrxIHDrseA2MsEIdgKBOAY90Z1JSBn6YPPA0rVS90n0EM4JWMRm6OVCC1o2kehiK1iJAzFHOzYOK
X-Exchange-RoutingPolicyChecked:
	PWq1d1P0ywpcwBRIA+nstyorslSwbWcdWsN4MvPM8Enb+2O/VlfzrLJrJrtKkCAjSVENNlnwp/I5yrx5S4F1jV1qg7SfDNpHBCngUYTTcxTm0YcEVK1YKsj0IXOJvwpw5UnrD3BDp3rWKqtY0XHyYEn1OAn9ZQl4JBPDFLfQDQTLBPT4EMhkdaR0foOYmAKJYSkjpHfSl48zKvMQ1jc7+VDNBv0YTXvXQt9Lc4YpMk4u57Nwjc3fw5YyVadZ6rIqyBu4pV0+3DZFgTS8KSBkbN0KYrkHgS9anOAUeXq8IuyZm+5JhI7P1AmALBUoZsSMzyeVhMA986K0WJV+QRU4zw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:59.4669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 522641e9-2bb2-4b5f-b528-08def6f224f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
X-Proofpoint-GUID: n54sLsToTukNoilBaiqW6qVZ28hK4juR
X-Proofpoint-ORIG-GUID: n54sLsToTukNoilBaiqW6qVZ28hK4juR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX/DAojZ3xHMRl
 KDY0kmhc6OlaBLKKNxFqlrqDmpq+oCE3LlkAqSr+oUmuiCZ0wmMBhatmXjP9dzEv2EZLfHpe/lO
 KzIbedVRvRehepM1U3ABkBNHovH+Mw5tJOPIdxSQIKfOT5ZlSpJQsIHFwdAnxD0RFLWO6aGqX1u
 l0scVe2CbxINYP+2wYlx8iX80OqpzrtQVaIQ7qc0fKJLXMJJpvfrDmRbJNEoBr5W6novvnTKZIu
 moWoqUBzq+fYnsfr1+6SSFZP2/e2Pvgn0q3l7ATCZ5MigLS3tbkCR53pdC3mpl0YxmjVA3SRg8h
 +ie8S0v82FRa71bPAmFBZVpuRPugJ0OZ9ONb+TniQbOs6YlnEXwBR7Y8lsTlvwEp8ivofqZ1FF/
 Mht+EEBnj95sAOITzUTT2DqTQhPQByF66GiMpliEE7vzxpODzU85l19jV2vzX/T93/9bxux6xe7
 +TK2bC/bbsNcnmjx0sQ==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a79eaf7 cx=c_pps
 a=mU7wo4rWgHT00F++7wGdfA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=g6TaX78G5PB857Cctd4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX2tvQa14RpflQ
 W4/LrSzRXMcGpUM4l3/EaJBFrCFKEs8To22ApUgGY4eqdvuYifR86WgQ0Mh15saeD+Cv+nzvrJi
 PCdyUwxVm64sE+ZzaWA7oQ1GDwTbx2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 3130805a8ec40..3ec5cc932280c 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ae8b8ebd5dddd..40ba114ac81dd 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 62c15b0cc9ae7..767b73021390d 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -614,6 +614,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

