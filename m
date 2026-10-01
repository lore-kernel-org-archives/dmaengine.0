Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF93B3C19;
	Thu,  1 Oct 2026 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839116; cv=fail; b=VzW0PQog/Ql44jOoVliCq493aHOzAbtbEGhUNCdv8koKNPR9/WVP/cRPUSoTREbVw8xR6CnchWHwno850ahzq2FAmUqvOXD5z1unLtJmdqBv4NVE8p4Z8uOusmsdmK+FFjn2Tp9xbE3WnIeVtRu4tWkKn9ajxZHVm2APNp8E9X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839116; c=relaxed/simple;
	bh=S8UgUPx8958LU5fyRdsrtdupEVcNoNMkmILBZM+nEHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aMP8sTVeAar+Mgv9vw2faWotR7A8rX4lZ9yc2I84n2h7vmW0iDy4OeIvQ2uJgm0QcTV9sOSqhjDWQI4RnDykxwefWtBde+YFXVvvEzegZ2UuYzzeDH7KmUxL6BOUfCWMHqxtUKuO6+xQGpXL5ziHTyq7PS0sfkwTlZGiL4xKsNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pgOvbS3H; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=X0rJM/R1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pgOvbS3H";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="X0rJM/R1"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691710tL1294534;
	Thu, 1 Oct 2026 02:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=q2yveFGt6CGWLP1XOcDjI+As9MCGhT/QUhU/nHiwV
	ME=; b=pgOvbS3HfOssvIxwcaAv5LhgfgsCet+oDZJjHrO++6ajUUAjBs1YYF+IL
	GfMw+aXnJzZOWkGIlv6zc56MABpgnnCXjvz5knTIfqiLqCAqqG6B9yQOO5KLlCvI
	LMoV8nEkb5VXfZfIAPAgqQwTeooABz3pFvfjDspzms1uEQMnxOTnU8EestrH0Ow+
	BCkjRX9xK1qmOA2onKAYJlT/zdG2IrM+tyTvrUuHyF+wQ3Bk/5NpiDzDgJ4ZRO+n
	GjDrHnRd8OgDgxGVPgFCrjY41wl6Og6suHGF7m+1CX1+Xb3U9Yhs8rEOSs3P2C9v
	1EAd9v5isFWAW9tbkU5yssi+ha3mg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h1eur99m2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 02:18:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1QUXaLcimLrCK61cGp6mZQogoU2UWrUGYi7/t7/lKNpneTvmzNgCFWvmLqQWqRpKzKN4wsT5K5xkLor2PdvdieZO5vY3C7ZCTIM4lAFVhompK1ICUpnbHG9oCjWz1GxwsgpSLoUkrk7H/BkJxh+sidTqTEW88p7AKU37IuyveIm/UwYiVqfk2fKaAYV75wU6w0dUANezjV9OK6FTsLEpjTye30H54NLruQmZc0jqhQkSCs2yDNZOOT6y5FrPfS4S2BD8es1ynvqb+ckEoDwgNbG0VxTFMOAj1E1LxOBJ2vjZB8MzvLe8FkRl0b4RY8Mu8rRRedXeX464r2LUFaKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2yveFGt6CGWLP1XOcDjI+As9MCGhT/QUhU/nHiwVME=;
 b=lgXSizdK8GMM5p8ZMSRq2nVyNaxre0QBQTCw4Qn7cV16Yl3flFt92sEG6VJAlvGJt3B10CYxaZaoAFs3Ld1z+zD0+xEc8dteE4qCr0TYgXv4gN4JCoHaz8Rz1tYPrnUJRSlQkU4Hvywm3ouGsUjyG0Sjscrm7R3WdzGfwYONe2T7fB5oaziKKHOd8QS+9tj5/LQ5NVtZoQ1Ron4Ty6RN3gbPXwnNKUoMhj+oslo3oU5CICFGoolamE8lKOF9eU/zN5qaWnB9HAIOxOm0NTYokBsSdog9TUusCKEucZBDYJqWOSvkut+P/rVloA98u8Ns0Ag98hdj7cWveXKDrPKx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2yveFGt6CGWLP1XOcDjI+As9MCGhT/QUhU/nHiwVME=;
 b=X0rJM/R14Jr6SPGiK1WWlJ7kGLiLw2IyMPLm294lXfHK7oQ5qAkfL08nk0xi1gPpr734x66ZY/IR6vPhmgVOvIt4XxwDqWLJRxfbC0ofkrq4ovbG6I52sKlWYRu5t17Nm8mS1P61xy65xLfNWexlpPRLNGVYK7tRnYIfg5+4ooo=
Received: from CH0PR03CA0236.namprd03.prod.outlook.com (2603:10b6:610:e7::31)
 by SA1PR10MB5686.namprd10.prod.outlook.com (2603:10b6:806:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 1 Oct 2026
 07:18:14 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::65) by CH0PR03CA0236.outlook.office365.com
 (2603:10b6:610:e7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 07:18:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 07:18:12 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 02:17:41 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 02:17:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 02:17:40 -0500
Received: from [10.24.51.254] (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6917Hadc499688;
	Thu, 1 Oct 2026 02:17:36 -0500
Message-ID: <26c79522-19d0-4e81-9b1f-95079c5ccc86@ti.com>
Date: Thu, 1 Oct 2026 12:47:35 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <Frank.li@nxp.com>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-18-s-adivi@ti.com>
 <179058477464.77164.14142591296597152152.b4-review@b4>
Content-Language: en-US
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <179058477464.77164.14142591296597152152.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SA1PR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d826eb-85c9-4683-b1af-08df1f8c2723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|23010399003|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	leryoFWNNfaJbnwjRlIigPUd6INu1il7Jw/NQRy0fkyu1NiRj5taH0F3Rg4+gTJP1UJdAUaFYpPlRb1HJJxnUjsxXtlT4Tm6vbLYWyuNWxwZKswu45s9++Ms19MHA8OxBdqyqWm1v4YdEPHf0NU+wIZmD8Azbsry36yda/w2LydlB0XV/Xzp9OTqMzMuX16E+N/tQwQtuo0Go/G8QXQaOLtRfC32ZxYjOuHZnJIhwPtr69BSMiAWBht6RnWMTXFaBtLc7tJmN1sKaLhIKDL/owebEwg1ocpchwT7RwbKiII5J8vUmADTmul+524Xifbu0K08U4t60tdx3rHz08Up0yx+6KoVbDWQ0Edut9pddU7ujTlo/eO+/Y0yAEZ6QIKTupvWBFxRigNfJlC3Jek6rQa7Lc+ujGqG+dpgRJDa5+/3+8eL0GytS19KUdmRl3CgRjpzRgT4rgr5N/tGBSuPIhveHoGb7uK12QbIG0iyyxRcVnjS5ZIFccbgVvefq0OsdQehNJ1LJCjLF2wBfYSxiipt8aXzVPqUsRoSAYia0LY2860rJZ5lfZHhW72HuARK1wE/2dU8bEYOnrAEq6pafDl1hDTEmJ1+GABaNojG/7X6P2Bd4MI7mYK7AdB5W1XHJrbQQn4QgksG2vN8bR0DcnP/D0PH/rLgFWiipb04Y62/x08CAJ3pAhKnLwobV9FMK14aSVEjhwctt+RcCix5yQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PSlCPmCLw00ZOoG72j0YKc+trsBvCaRfZsHwqG0rt+wLa7Ea2xlbSpCRTg5WqP34Fb/YAl3sgZeR29h/HWiAUHLaHL+pUCEfcmiawSen3aLxmoOp1VqAq2riVKAzmeBrVdynpdNKl9VyUXr+VCq4/6J+rlvvERPMXMuDykCyN0A3svlZJbH/bZtri92EkoYxS9QJ5ANochJcYW5V2FfM0MGzCaV597VggQzZ9/PpNELvcndOtWBsBha1wQf8gCXI2grQuemYVA09kQRHVx04/d8ZNukt+ExHqdSgIA0HKSj00GMTBWTFCE7J0BAkHog9CyvkDi7zrcSB14JfrbFpfXeZp0DhVPwQ4OVus8iMKy+H/N+ND5ReEEggZf9xEgJH2/srTjwmY8LnLJo71ONEeBkk2ixwtCsnMSyEruzBPHZwKDDAfL2oafScYRnEQzBp
X-Exchange-RoutingPolicyChecked:
	x6ZTb/M3sxRWoD1dZP0AN3O5MfxUpLKal1YFQTPwIU56mUiZhohFxA7ylD/zeBR0P5c+a33+xO7vlviw30MZY7x5HBYXbfEFKejMOO1j5JZzKE5n5wRGUHsAYJ+EkRvJxfNCG7KsU50r0e5iNt92d7fkCF3DW99E7WEznpsg3Bu9vgf3rF/ZgkXud7aW3nEUPKxIC48u/UoB0sPmDlEr8toQxfnOlzKIyFaWnJf0P4qRkh42N2GwvErBfP0E/JvGT4OaMKD2zlOymzGXdnGjaKcKedhe2FIwMPOInnS7CrZteweW3I9Ehdsy2l6GqemQkfSCgA/I40menVyuxfk5+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:18:12.1256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d826eb-85c9-4683-b1af-08df1f8c2723
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5686
X-Proofpoint-GUID: jVBfd_2PBMZaMBLzU02LCDPNAEems7KP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyOCBTYWx0ZWRfX0UqFsp4AzrmD
 VVcHfNR0Io4T8xocla+yXf6tVjPxEXfhzxLsNeOJQoXiMV4lKs4Jn4dS+B4hdg/VRdU591rZ2UK
 f+FQau1EBXc+B/w5CLI5+hp47GOIMQubtqSRm94JFcGO5FA77yZBI7TuRfWCySg1+QhGp+enljC
 tJtk8sr4R5MGYYC9CzCPBBr96pqGNO+m6A/pf5anH8usieSRpPyYj6KBj0n03FbxsStPvjfL/Jq
 tLkZqZ9G4PYnl+rUGK1w2uI/rnSAHYRkZq/Ti6Hwdjx2LeuAFh/OPshz+nkx8UhGo5svkZhDBlM
 iIZVETyRk3QlbFie3zax39ziWKnXU33o0TZo73padbZURx+vv9QWkuyL6ruakX+SPAXimfSIvXp
 XzjOxV6LwN3w6smBwq0mSWLyKLB3xGJKahYc0Z0v1uU3o/0I7vm8Bip3R6zIGzn4atrm0HXGFPq
 91DOUS3gDpSqXuBjFXA==
X-Authority-Analysis: v=2.4 cv=KvzYSmWN c=1 sm=1 tr=0 ts=6abe093b cx=c_pps
 a=6gnvs+K4iRzQbkKjpWE4KA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=tOSaQQ9mWVjykrKE7QsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jVBfd_2PBMZaMBLzU02LCDPNAEems7KP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyOCBTYWx0ZWRfX7hrA8A9Pyfnw
 88sy2sSvyXbgz0lxFQATpD3un6Wxc77uo/gJV3774VHS7vNAf7zx7ZV09+QPjC7tUcZIHjzhq4W
 z9ERgwL1RoQ0zkqHTdIZMotWL5anWRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010028


On 28/09/26 14:09, Vignesh Raghavendra wrote:
>> The PKTDMA V2 is different than the existing PKTDMA supported by the
>> k3-udma driver.
>>
>> The changes in PKTDMA V2 are:
>> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>>   needs to set in the RT_CTL register.
>> - Static channel mapping: Each channel is mapped to a single
>>   peripheral.
>> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>>   directly connected to GIC.
>> - Remote side configuration handled by DMA. So no need to write to
>>   PEER registers to START / STOP / PAUSE / TEARDOWN.
>> - Unified Channel Space: Tx and Rx channels share a single register
>>   space. Each channel index is specifically fixed in hardware as either
>>   Tx or Rx in an interleaved manner.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>>
>> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
>> index 30cb8044ff10..5fa3a7b8d202 100644
>> --- a/drivers/dma/ti/k3-udma-common.c
>> +++ b/drivers/dma/ti/k3-udma-common.c
>> @@ -2465,9 +2465,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>>  	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
>>  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
>>  				  GFP_KERNEL);
>> -	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
>> -	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
>> -				  GFP_KERNEL);
>> +	if (ud->match_data->version == K3_UDMA_V1) {
>> +		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
>> +		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
>> +					  GFP_KERNEL);
>> +	} else {
>> +		ud->rchan_map = ud->tchan_map;
>> +		ud->rchans = ud->tchans;
>> +		ud->chan_map = ud->tchan_map;
>> +		ud->chans = ud->tchans;
>> +	}
>>  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
>>  					sizeof(unsigned long),
>>  					GFP_KERNEL);
>> @@ -2566,13 +2573,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
>>  		}
>>  		break;
>>  	case DMA_TYPE_PKTDMA:
>> -		dev_info(dev,
>> -			 "Channels: %d (tchan: %u, rchan: %u)\n",
>> -			 ch_count,
>> -			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
>> -						       ud->tchan_cnt),
>> -			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
>> -						       ud->rchan_cnt));
>> +		if (ud->match_data->version == K3_UDMA_V1) {
>> +			dev_info(dev,
>> +				 "Channels: %d (tchan: %u, rchan: %u)\n",
>> +				 ch_count,
>> +				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
>> +							       ud->tchan_cnt),
>> +				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
>> +							       ud->rchan_cnt));
>> +		} else {
>> +			dev_info(dev,
>> +				 "Channels: %d (tchan + rchan: %u)\n",
>> +				 ch_count,
>> +				 ud->chan_cnt - bitmap_weight(ud->chan_map,
>> +							      ud->chan_cnt));
>> +		}
>>  		break;
>>  	default:
>>  		break;
>> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
>> index 70eaf7ee57e6..996c130b10f4 100644
>> --- a/drivers/dma/ti/k3-udma-glue.c
>> +++ b/drivers/dma/ti/k3-udma-glue.c
>> @@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
>>  		goto out_put_spec;
>>  
>>  	thread_id = dma_spec.args[0];
>> +
>> +	/*
>> +	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
>> +	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
>> +	 * PSI-L thread ID before the common path checks the direction bit.
>> +	 */
>> +	if (common->udmax->match_data->version == K3_UDMA_V2 &&
>> +	    xudma_is_pktdma(common->udmax)) {
>> +		struct psil_endpoint_config *ep_cfg;
>> +		u32 psil_thread_id;
>> +		bool dev_to_mem;
>> +
>> +		ep_cfg = psil_get_ep_config_by_id(thread_id, true,
>> +						  &psil_thread_id, &dev_to_mem);
>> +		if (IS_ERR(ep_cfg)) {
>> +			dev_err(common->dev,
>> +				"No PSI-L config for flow %u\n", thread_id);
>> +			ret = PTR_ERR(ep_cfg);
>> +			goto out_put_spec;
>> +		}
>> +		thread_id = psil_thread_id;
>> +	}
>> +
>>  	if (dma_spec.args_count == 2) {
>>  		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
>>  			dev_err(common->dev, "Invalid channel atype: %u\n",
>> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
>> index 44c097fff5ee..525155d3bb51 100644
>> --- a/drivers/dma/ti/k3-udma-private.c
>> +++ b/drivers/dma/ti/k3-udma-private.c
>> @@ -174,16 +174,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
>>  
>>  int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
>>  {
>> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>> +	if (ud->match_data->version == K3_UDMA_V1) {
>> +		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>>  
>> -	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
>> +		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
>> +	}
>> +	struct platform_device *pdev = to_platform_device(ud->dev);
>> +	char irq_name[10];
>> +
>> +	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
>> +	return platform_get_irq_byname(pdev, irq_name);
>>  }
>>  EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
>>  
>>  int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
>>  {
>> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>> +	if (ud->match_data->version == K3_UDMA_V1) {
>> +		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>> +
>> +		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
>> +	}
>> +	struct platform_device *pdev = to_platform_device(ud->dev);
>> +	char irq_name[10];
>>  
>> -	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
>> +	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
>> +	return platform_get_irq_byname(pdev, irq_name);
>>  }
>>  EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
>> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
>> index ba3042e866ca..a71471aa7707 100644
>> --- a/drivers/dma/ti/k3-udma-v2.c
>> +++ b/drivers/dma/ti/k3-udma-v2.c
>> @@ -578,7 +578,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
>>  
>>  	rflow = uc->rflow;
>>  	if (ud->tflow_cnt)
>> -		fd_ring_id = ud->tflow_cnt + rflow->id;
>> +		fd_ring_id = rflow->id;
>>  	else
>>  		fd_ring_id = uc->rchan->id;
>>  	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
>> @@ -770,6 +770,148 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
>>  	return ret;
>>  }
>>  
>> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
>> +{
>> +	struct udma_chan *uc = to_udma_chan(chan);
>> +	struct udma_dev *ud = to_udma_dev(chan->device);
>> +	struct platform_device *pdev = to_platform_device(ud->dev);
>> +	char irq_name[10];
>> +	u32 irq_ring_idx;
>> +	int ret;
>> +
>> +	/*
>> +	 * Make sure that the completion is in a known state:
>> +	 * No teardown, the channel is idle
>> +	 */
>> +	reinit_completion(&uc->teardown_completed);
>> +	complete_all(&uc->teardown_completed);
>> +	uc->state = UDMA_CHAN_IS_IDLE;
>> +
>> +	switch (uc->config.dir) {
>> +	case DMA_MEM_TO_DEV:
>> +		/* Slave transfer synchronized - mem to dev (TX) transfer */
>> +		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
>> +			uc->id);
>> +
>> +		ret = udma_v2_alloc_tx_resources(uc);
>> +		if (ret) {
>> +			uc->config.remote_thread_id = -1;
>> +			return ret;
>> +		}
>> +
>> +		uc->config.src_thread = ud->psil_base + uc->tchan->id;
>> +		uc->config.dst_thread = uc->config.remote_thread_id;
>> +		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
>> +
>> +		irq_ring_idx = uc->config.mapped_channel_id;
>> +		break;
>> +	case DMA_DEV_TO_MEM:
>> +		/* Slave transfer synchronized - dev to mem (RX) transfer */
>> +		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
>> +			uc->id);
>> +
>> +		ret = udma_v2_alloc_rx_resources(uc);
>> +		if (ret) {
>> +			uc->config.remote_thread_id = -1;
>> +			return ret;
>> +		}
>> +
>> +		uc->config.src_thread = uc->config.remote_thread_id;
>> +		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
>> +					K3_PSIL_DST_THREAD_ID_OFFSET;
>> +
>> +		irq_ring_idx = uc->config.mapped_channel_id;
>> +		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
>> +		break;
>> +	default:
>> +		/* Can not happen */
>> +		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
>> +			__func__, uc->id, uc->config.dir);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* check if the channel configuration was successful */
>> +	if (ret)
>> +		goto err_res_free;
>> +
>> +	if (udma_is_chan_running(uc)) {
>> +		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
>> +		ud->reset_chan(uc, false);
>> +		if (udma_is_chan_running(uc)) {
>> +			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
>> +			ret = -EBUSY;
>> +			goto err_res_free;
>> +		}
>> +	}
>> +
>> +	uc->dma_dev = dmaengine_get_dma_device(chan);
>> +	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
>> +					 uc->config.hdesc_size, ud->desc_align,
>> +					 0);
>> +	if (!uc->hdesc_pool) {
>> +		dev_err(ud->ddev.dev,
>> +			"Descriptor pool allocation failed\n");
>> +		uc->use_dma_pool = false;
>> +		ret = -ENOMEM;
>> +		goto err_res_free;
>> +	}
>> +
>> +	uc->use_dma_pool = true;
>> +
>> +	uc->psil_paired = true;
>> +
>> +	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
>> +
>> +	if (uc->config.dir == DMA_MEM_TO_DEV)
>> +		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
>> +	else
>> +		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
>> +	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
>> +	if (uc->irq_num_ring < 0) {
>> +		ret = uc->irq_num_ring;
>> +		goto err_res_free;
>> +	}
>> +
>> +	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
>> +			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
>> +
>> +	if (ret) {
>> +		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
>> +		goto err_irq_free;
>> +	}
>> +
>> +	uc->irq_num_udma = 0;
>> +
>> +	udma_reset_rings(uc);
>> +
>> +	if (uc->tchan)
>> +		dev_dbg(ud->dev,
>> +			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
>> +			uc->id, uc->tchan->id, uc->tchan->tflow_id,
>> +			uc->config.remote_thread_id);
>> +	else if (uc->rchan)
>> +		dev_dbg(ud->dev,
>> +			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
>> +			uc->id, uc->rchan->id, uc->rflow->id,
>> +			uc->config.remote_thread_id);
>> +	return 0;
>> +
>> +err_irq_free:
>> +	uc->irq_num_ring = 0;
>> +err_res_free:
>> +	udma_free_tx_resources(uc);
>> +	udma_free_rx_resources(uc);
>> +
>> +	udma_reset_uchan(uc);
>> +
>> +	if (uc->use_dma_pool) {
>> +		dma_pool_destroy(uc->hdesc_pool);
>> +		uc->use_dma_pool = false;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
>>  					 dma_cookie_t cookie,
>>  					 struct dma_tx_state *txstate)
>> @@ -1032,11 +1174,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
>>  	.rchan_cnt = 128,
>>  };
>>  
>> +static struct udma_match_data pktdma_v2_am62l_data = {
>> +	.type = DMA_TYPE_PKTDMA,
>> +	.version = K3_UDMA_V2,
>> +	.psil_base = 0x1000,
>> +	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
>> +	.flags = UDMA_FLAGS_J7_CLASS,
>> +	.statictr_z_mask = GENMASK(23, 0),
>> +	.burst_size = {
>> +		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
>> +		0, /* No H Channels */
>> +		0, /* No UH Channels */
>> +	},
>> +	.tchan_cnt = 97,
>> +	.rchan_cnt = 97,
>> +	.chan_cnt = 97,
>> +	.tflow_cnt = 112,
>> +	.rflow_cnt = 112,
>> +};
>> +
>>  static const struct of_device_id udma_of_match[] = {
>>  	{
>>  		.compatible = "ti,am62l-dmss-bcdma",
>>  		.data = &bcdma_v2_am62l_data,
>>  	},
>> +	{
>> +		.compatible = "ti,am62l-dmss-pktdma",
>> +		.data = &pktdma_v2_am62l_data,
>> +	},
>>  	{ /* Sentinel */ },
>>  };
>>  
>> @@ -1055,15 +1220,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
>>  	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
>>  		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
>>  
>> -	ud->bchan_cnt = ud->match_data->bchan_cnt;
>> -	/* There are no tchan and rchan in BCDMA_V2.
>> +	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
>>  	 * Duplicate chan as tchan and rchan to keep the common code
>> -	 * in k3-udma-common.c functional for BCDMA_V2.
>> +	 * in k3-udma-common.c functional.
>>  	 */
>> -	ud->chan_cnt = ud->match_data->chan_cnt;
>> -	ud->tchan_cnt = ud->match_data->chan_cnt;
>> -	ud->rchan_cnt = ud->match_data->chan_cnt;
>> -	ud->rflow_cnt = ud->chan_cnt;
>> +	if (ud->match_data->type == DMA_TYPE_BCDMA) {
>> +		ud->bchan_cnt = ud->match_data->bchan_cnt;
>> +		ud->chan_cnt = ud->match_data->chan_cnt;
>> +		ud->tchan_cnt = ud->match_data->chan_cnt;
>> +		ud->rchan_cnt = ud->match_data->chan_cnt;
>> +		ud->rflow_cnt = ud->chan_cnt;
>> +	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
>> +		ud->chan_cnt = ud->match_data->chan_cnt;
>> +		ud->tchan_cnt = ud->match_data->tchan_cnt;
>> +		ud->rchan_cnt = ud->match_data->rchan_cnt;
>> +		ud->tflow_cnt = ud->match_data->tflow_cnt;
>> +		ud->rflow_cnt = ud->match_data->rflow_cnt;
>> +	}
>>  
>>  	for (i = 1; i < V2_MMR_LAST; i++) {
>>  		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
>> @@ -1117,6 +1290,7 @@ static int udma_v2_probe(struct platform_device *pdev)
>>  	ud->reset_chan = udma_v2_reset_chan;
>>  	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
>>  	ud->bcdma_setup_sci_resources = NULL;
>> +	ud->pktdma_setup_sci_resources = NULL;
>>  
>>  	ret = udma_v2_get_mmrs(pdev, ud);
>>  	if (ret)
>> @@ -1124,7 +1298,17 @@ static int udma_v2_probe(struct platform_device *pdev)
>>  
>>  	struct k3_ringacc_init_data ring_init_data = {0};
>>  
>> -	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
>> +	if (ud->match_data->type == DMA_TYPE_BCDMA) {
>> +		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
>> +	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
>> +		ring_init_data.num_rings = ud->rflow_cnt;
> Hmm, how does this work? Shouldnt there be ring allocated for both tflow
> and rflow and hence tflow_cnt + rflow_cnt?

Vignesh, just like the channels, the flows are interleaved. So both
tflow_cnt

and rflow_cnt are set to the total flow cnt in case of V2.

