Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E244D4875;
	Thu,  1 Oct 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844215; cv=fail; b=sug0HxY4GCBtKOiLi11vgJHU3ALeEu0VNZSlQmq595wmxeuRydzeNpExAGO2G5PudSb1SnuCaAEdBwB6hVkIlk21PjsOXYQc+ouiRa92Pozj8y8IPblaBMfKub9GPWtIZWa+OOCR01Zl9ObtaxSHHbS3UjuqHu14eBN0c12qki0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844215; c=relaxed/simple;
	bh=3K1s9GTC1FstoujEp0eAMHfg2f1NAEaci9asyqilH/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7+58z9NIM+gMiKXXusy70JFJMMTUtNHFX+bd68KlryZRKey6WebGXy1JkNRpinEioqSwzkA5kAZQBgOpa9HbMqJoiGFrZX3nYW9xwRgCarIE1HYOeC4Ucqt2G8FZrTOVBbt3m++HWJZW/KxcTgN6P2MYaY5KU8ujA5TaKc+i3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=U/lyBqvO; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=NIqg8tmt; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="U/lyBqvO";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="NIqg8tmt"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69171GQw793670;
	Thu, 1 Oct 2026 03:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=duQqGU/0MkeWYJ2swF2++S8zneXQqlbJ0gBvHW16/
	1M=; b=U/lyBqvOV1sctuAF5qc5ThTHF0CrOsbTq1+MeOtkJaY+y6DHG+fdsYlae
	5xZ2mhKY60Qw0uufRhQNOxHlbZQB0dCAxBogylbJ4hdeQOs7N1OJ3EkXw0e/nKRK
	ZL7HnW3hH04n/qKRuDJCdMeAPIIsvHSvNpSXrCIN6C27nG7Y/JBETeN6KtPAKk8x
	fwOP3wJ368hYtrS+94P3YhMeahkoNEGD9yNGcJctnHj2GUZIgUyrYjrRrO6pe3qm
	YQNPyxGAtAMsTptutnTlvEB0iuZw02U3PuBwzFrTSBpnZzpQ++jAD5HcZzjZS0zM
	fGvhxxXCJyAn5AxeBUvjjunpM5C0A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djv3fs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:43:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxxtxbq1xM/nmiSTICk3xM2orhZFaJQqpftI3rgsvq7GgZ0BhZCmkZtRYjV27fOfymI8DybF0v2o6lIEiyvg2NExihdf5RLvSQ8TG5fqbXLOs5Z1J0U/M6I1SCaUFzAZPNKAOcQqYTKrvkUiWf2CuMWAQg0sdni9xkK0o5tJ8+OXgc5f+i6uEG30HOy8XLHgFoU/KAGEdcDxHvH/RhyfcbJ3Ydiz/rK5/lJNbt6INWiMVI92eNVrkr76O47tq9lAX1bUWYT5eBCwk8ljJtzqDPH1NDnu6U75RC6aXjZ36p+eiC5K/QnN78pUlq/HwPvl5atlC3ayWLEaeV8emcF1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duQqGU/0MkeWYJ2swF2++S8zneXQqlbJ0gBvHW16/1M=;
 b=G3lNznLO8m7jb1iJAhNMlczoPy0ixc7FQdZOo53mrOpMWwfoiYh19Gi4zFTmgH055n3Onr2WH8T8zdGcT15k/GteDRG0XPqs5EG88tpH53BMykR6fzzftmhgKMGqCt4Rn+P2iiEf9dYWmBJeYKjlZygHwxGGujTgLE837h8FTpCMSQ84s0s4bwEDhVA84vBykRxcIp8AY7arOCUlA1g0Fgh81mVC1yZPFzQm05UTgcaf2KCj1EMojQyvRqq/YhJk6Nv6YN+3uhHw2ygriUZxgFHkcJlPm82FJzaFk1HH3kHFk0QkVB43aEJL+intq69pNIDiM6ogyXlOsNyxFGDUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duQqGU/0MkeWYJ2swF2++S8zneXQqlbJ0gBvHW16/1M=;
 b=NIqg8tmtSNmL6QHH7KS3X8/ezUeLDQ7byO8DHCYIZTGIjZANyOl858nkrteZeWiM90G7wx7TNEdXgQsmfZghjmHWlWOiucDuJjVjmPzfAyUFKeSVXWOf6dHf4RKlsJXcaMiZLpORfvj9yzXFWXQgrfPFsZ3Rww4Ry6YIACsgg8A=
Received: from CH2PR20CA0010.namprd20.prod.outlook.com (2603:10b6:610:58::20)
 by SA2PR10MB4506.namprd10.prod.outlook.com (2603:10b6:806:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 08:43:14 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::50) by CH2PR20CA0010.outlook.office365.com
 (2603:10b6:610:58::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:43:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:43:12 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:42 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:42 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9sA630551;
	Thu, 1 Oct 2026 03:42:37 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Thu, 1 Oct 2026 14:10:35 +0530
Message-ID: <20261001084105.1692228-20-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SA2PR10MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e79d86-2298-4403-1e85-08df1f980712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|22082099003|18002099003|921020|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zXnyAFb9sB1xJsetBrlB49ygcdtron45OiX393mn2/z3dJnWBgTXeUdh5VrHziS0e3hHdCg71w2bWXeiIF/pzqilzHU0VkuXfMNwAcVFTe4huZ/dZPZILIxyaLHBfjLXWRYGslMfAVcQAYFOAPYlwzg2N/IanDIe/T3RcrXp1h5WKIZEPsYhra5zRoyFJoN0uunYK5/WDSoqhy15KxtQN9tnVZY5IcMQVJ/0dERYlNVVZyEhWXnEI91I5F6Itgzg6sWYQ8lGGadIlMXvoj/9ED2QOtr3eB3dyt67b/hhgEybSmHI4VHYA4WNA0VWLVCSr6LHch5Qxv2wf20OiqGR5wl7fdfkRhRTkoZ4lz2oZyWp4O3thuIBXg/uNoxaJqyb2znmwjVx6ma6WBFggjqlvihqCwnVk0+GNByvnnyKKP8qX4lZ1fLFD4FcWglQhyePm6+9TZgx3wMiVmQo3xNPAxufiGLfzyMcsC9lol03jAPuZlj77O1ZRmF10lGO4ZYwnw7y6CYPHfnP4+VGpY+iUluFU68KO38tg1sD7hecjVhI4JmfMEbkLlGsExa/3VIqYbEXQfI1mOBRK41lCb7IjbF22FPq7FPnVb9CKIL8SzeW4c6KqpmtxLxvy+KgLhWgKz6LeQvK3vEiHtq5k0otQuS1ptuvN1Klh6cmxWi43eJ69gDM4/cHl3YrarZABiqImSJ8EHAb060xphqLNqY7Z+WLDaoXLQJNYvbEkThAkvHK5kv6bLVBfTNS6vy/vUGN
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(921020)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZTeyh8i1Yl4UbWspe/0bP0cc75AYP+UaGI8SgyFv05PzfPwnNSDKwnZv0UQlM/gcQclDvm2khjUp41Xj7HaA1ZXRlhc7AA4QOmwzzGN83CM9CqkI8npQFdj89BcJGOb/Gb/YHVHmPXSb+h7YRvzBsozR5qujYnOLjPOHrU6cB/ed1eKzVcV591pfLUQuPF4sgD1tCljm5qsGTv2ULYp5yVo6zgJiy8pH45kWOUMI5ARxDpHrBGNZoM0IIIEzSdBwwjc3QUEn+1+pp6HHYjFtkj2ssfopaGH8KP4EgVF71QzUiECc88oJUrkbu3FBD64lIz3Gsei/7XlvZy9kiGVPHJE0KlyU0JzJv9tTYNFSbtbSV+V9HKdXPaxnN5y9EL4MsxiWXTKJMtQ12ZVw0NmrFx70GhbRqTanPegRmEK41tHmAgrx6SIpCj0saZozHwBR
X-Exchange-RoutingPolicyChecked:
	oY9tH6u2sn9WEKpnNbrdsOYKtZ2a5LrQisD5VPW/l+ltO2s1imqMHP3wZyXjZRpe0SUWN1WDfXLMBk8uZEOOozElAa4DuAQWDAfIaPOfckErsHGSzLTBNGO+sf59aagCYyO4ou9+/ZWFlxdTbyhVseNUrWKLJ98fE+p15TdTwsXqk/g5nP9+dm9J9R+RTPXcqm7ayMJ35LdJMj6kpuGpWjJh8WwqQ2GdrTLwruaFhhgOg3By8Gk/73atP874ALODrODZ/gBH/teN1ZJraWbwILPyWrwmj7tELbkEspReWPhx1894rexYriBIzBYNg9c+rwU2CONVDJ44g8pTaCEcZA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:43:12.3100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e79d86-2298-4403-1e85-08df1f980712
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506
X-Proofpoint-GUID: ajNCttmYtMJ954xH1JQVP28vjKAMSAo4
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abe1d26 cx=c_pps
 a=kRgXGWC4h8N5Zk8PQP6WEw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-ORIG-GUID: ajNCttmYtMJ954xH1JQVP28vjKAMSAo4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX3xeL8SFTn1Ep
 xZuRQLakwV4RsQpkBrp6G2Kju30aiToMKX5GI7rxtsxXgmTyFVrckjo1KdkfCH99jrWcyZgc/iW
 nScYDzrjZNL0USajoiM9JWBLlC0j9U4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX2+GFnF83Kxm1
 cVHBmdj6cUyJpbCmQZu3KFypDkRrDQJIRb/XUxuQ0oEaxo0Ru1blGhyNBEOad6UtTri8Djc7dT5
 44Cjxvw3LBnRIc+cpqWx82gcgdv3hTGom2jL9TLzPQPGmpWEzmvpWRourn9vkrsZA0QVEH11slV
 gKoTDCuZB8g300WxnhuFqF7IN3584/c0sGlWQItuLGQiH3TPOwiZjIbUYbRKaMDdX+tLAr2aUSH
 Mm40Dr5/6ZpoA0sMG+VgesNZCEGQno8iQ66GdRo0Ds6P912uHBB8182GXAQcvtso3xG2KmUQl1W
 6voUvOMMaheTXVsPCuU+mwWyt/24HGp/PBnD63cwWO+mclx4ITsb2DtH+5jwj2bjuBJsLFu7lGR
 yoAK2J7mmVAekKm1Ay1ohGdX6MxntbAcmNMii30aC/ixzeVu8PWNOoHLM8Ismdb8Z82wMobD7Av
 UENl0VuOvyeJmk9B2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 5602ac551d5e2..a1c72f294fe37 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2021,9 +2021,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.55.0

