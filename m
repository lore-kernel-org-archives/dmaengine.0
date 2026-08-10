Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE941378C;
	Mon, 10 Aug 2026 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374981; cv=fail; b=I+j0p806BhoT7HlBXqnzylDQ2tVS+nd0XbMlpgtA0owmhaRpgiMYqvauzB5JTg221WccEL/qTffHUqooZ43eXpZ9vYA4htomfYtBNgQfiAL/99iTUHmUJdehVL/L5h/3wux7lc8uTgBgrdC0Cfn0vDnTAIcUPPvfGQM7bTI2T24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374981; c=relaxed/simple;
	bh=+IBk0ff/7RCPczcogg6Q6dTfxyi8YaLSzGxh/2tQrtQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXawTjYTRIcr7Q7F6N2HSuGcXRFmELJ24T/Ty2W+UX+YKqWJwKdSb9EbODCjqqHdkE4JHMU9wQ4OP+MWZuAYdASbZ9G+kM5NHmNvptj59X3xsCPnD3/i4A0mIMlapprO8CeRORT3hC0Jfa3ku9FudVFb2Hop2EkvmMQuUmpPLtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DRlwpMQt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F8pC9JcI; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DRlwpMQt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F8pC9JcI"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUdiU3620481;
	Mon, 10 Aug 2026 10:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oR/53XB0kWEfdaks0NZIgUEV21+pduERdtFJKfkLa
	FM=; b=DRlwpMQtUZyVGtcPvs6EoT6nxE+mV6DVPRxKuR6iChlgcLl6CiXuFnQt7
	A5xfi4DF4Cs0p5CdDIDLsZF4evnbBThtxeKknrx7LGlWF2+54RwP+yiU1wDeh5F4
	pkM1DGPWSAj8fuC4SG4G0Y//iWL2H4Y2QbRC1cHB5OE1Hnd5nZNqQ2Loqaaagl3K
	E5qupD4nz6dJhK9BpBINaL0oL5U0p0Lc8AbUCV6pPXg/MtEeAvrIvUxBp73rjb6j
	OJ712u0mGn8WPjZUAE04Dsto+LRkg1ORt7/iIMhT+e7kzAraGa+Q6LQ2BXBEljqG
	gM/jYV9Lhbn1thW0naIQlH0NtzI2A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79h7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:16:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN6QgDohMRgfdUeT4hpBDneg19qFCGt234Ha+ilev5qO/B+sFoMHQdvQvWdssYm4qVLkaLjnm0VmE/JrHN+Ab3mKqqAf5X0T3DWm8E7sX9/OQvR16bLNtooBDs4kXqgopOLRYElrJE1j39FGOvvucRvR00RZ4oIwCsfi002+KAWQS90zGrDmyMNsKX/nP/TCYsHxcpS5mWEumz2mF9lLLX4hnyDSaftsPCKYPEPZwUXTRgPv6YmVWn4CBfghh4LPu3SdV/hb6vK8K4u0U6+0BbZD1zyF+g7GCcCrsbRjzfXKgWNqzfyGyHgaigxsHug8WuHiUyBE/3EdciJG4bpIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR/53XB0kWEfdaks0NZIgUEV21+pduERdtFJKfkLaFM=;
 b=zFRx1LIvBZs0j4VXDF6zAhub0LAC/rgpqV9Ix84oiR9LsPJrZO8ccJZ1AOh5N3OOY1FouxE14qW4wqkiMHf2cWg/wS9sqnQT40vJaZQlSy+YChXvN3dNCbxaqpjqW+vb7hvQGj3J0U/I9euaGNiNkBQF4kFdhppuwpuvAPjm/aIFvapR1L8EQZXUirrdDVG9wQOsfYwyw5s2VkOI+0cD1EZYjDWlUC8yARkH55nZEqFlSH9kzGHKLOLCdAkaWO2JY1TDx34Is5L/Jae7ADCVDbHCPWWwnAQ4h6ypasAE+jans1jdt//SPwiNzp4f1Uw4kv77uzDEIiUQHowuZ622EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR/53XB0kWEfdaks0NZIgUEV21+pduERdtFJKfkLaFM=;
 b=F8pC9JcIU2HM0tkbagq7p6tmGwaWxAAtrOCW78dTxaGqT/WE7oqkE2ZEvGbRUgZm7Wl249s4GZGBjp2TBEekU4qOhDZ9AqM1Zx4RXJquKgAZ/Vq4Mq7byzAZb/WMHVBkrDR7kPWVl9Z9+5bYM8Z+Nqt+rXqplUAgIBnd54jDdlw=
Received: from DS7PR05CA0094.namprd05.prod.outlook.com (2603:10b6:8:56::11) by
 DM3PPF8B2A18C0F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:56 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::6c) by DS7PR05CA0094.outlook.office365.com
 (2603:10b6:8:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 15:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:54 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:26 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:25 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW72648613;
	Mon, 10 Aug 2026 10:15:21 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 12/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Mon, 10 Aug 2026 20:44:06 +0530
Message-ID: <20260810151423.1948224-13-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DM3PPF8B2A18C0F:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fb9b75-0dbb-4085-cd91-08def6f245be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9YNsSZ33ChU8+NCO3NDQwLDUpZdvr+ZbYKc7MZe4RfuMMTyS006ef5F79HWZINDjztJMH7/ze/2m7p/+fLJ2LgriBqMUUQthka4v/BnnEACQGKtjdbM8VyJncfoaFRyvTWcLrJKrB1lEWrSJaH+vJlD29nZ1gKsJnRPgsci4yTdNl3RUNc8CAXqyS79SsLrzZVuHjgiL5hsuBDlKHNdqXGWidtiXJs6NfK7eeszWvDGt4hyQWLcM5vq2yWpkxMMrbyS+s2A4VAz0Yf9X8sEhmmup5akCjLiHFIxeKsWaXktAn14xoGt8J6lhxXbZYoBWmUsuBuXUtFQ9PodMw5OHT6mG5ig1oAk/zALeazU2yaw9OQwWiv7QL4SuuLxFZVx23f0JLrCAyS+o0CIB2MqF37YbZDP/9TpzSDGvEwPlCEdeLtGwil0yHtye0D9jRZGbo2zLcWXnt393EWIuEOf2IHrMaizv3XFfVauHKwFPoqdMKlyrq+T1tHWY99veT2Fstxaqd9thbjZ1hDJZ3pU+z9cFlQaJJNUoJfyjqdfpQvLZp+L2rh6eHBsGcXVmMZ6KQ3CIkETjtVnHHOT6X/PoVnbh2pKQ43JlPJG/8JPZAisp8xbfq87AuRd+ecGor9PEWCJyHuJ9WyDt3eTkwc3RCW0MgWBEnA+y8G/G9ZM6w6yDyLOSU6D6BMrdbAwOdSq5DlPdq0syDptY0Pk+PNoZGPnqeEQcXjBtPz2bY2Xap3lfx7EFYrEhrDvDWm3i0oQw
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yl/zSM8K8kAh5qZWZReesgRha4YB+mnLlmiAlO6VWppnMJQSwEfVp4Yu31q8UbeyS6pfNnZGjOzLcNXRllGCYXAdpBi/NPFbHfdeI4StuqL6aD9A6D9cb8GSKvX6nEpNKSWLX9TGSFyADkCWl8jxz8FvqKaRrK/ej6J0zD/ObIxg63btC++suCQV3Vq5CIMLHrzxQYjuJRDh+WjhfwgpO+v0vPkGfWkfniNnsV7jDIF/szT52hWQYT3fyoznm7hB5Vjd+NlSx53TFyos8GHKF3NXDrD+/qtHidk0AZbK5XmQS37N+zkzPpmnC6p+mQgoWbpMX5EYFbhmgIhb2W+u0kkI1jEqnzFToHIYFXfOie25LDN6OzMPSHz7iBR6UE2u2sOzw+TO27IIRoRRilP6lg3fgbR6KF/RUEmDU9mOvU1sKPigpYn3FUdcKv5rhCmA
X-Exchange-RoutingPolicyChecked:
	Z+02zOlJqXjp0LXWglbC2uAvxUILH1o6Z/SCWssSZsCo1YlhevmqMWbHM6F8Y9WdkRrY3Lb+ZDizkY4GEkXCluvE9+4oW8uTc0/ljCQ7kX3SSaSMcM6/OKmUJi0jlUC4bi5fIDNP/A2E0bXZ9YoZjQADRfjlgK54cDNWwtbmqrreF9tOg8Fan1vORZuuZd/87gbV4lrDNafBur1N/BDdXHjkzpwk7wtW0/Ad4K+jg0WL0TRDybF11QRtkAIVa7PzTwos8r8moKPD2wBNaQirTMpfNqz020Wu3o7eGRTKU8p/tDcLSa0iewljcujgNIX81fHCUIjqOv/7qFNChTVLIw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:54.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fb9b75-0dbb-4085-cd91-08def6f245be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8B2A18C0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+VRdXhIECuaz
 cVPePv/f+jsUwaXZYIcDtTtmhp/PIwjqcj1VEH1wY/E7C40bmEUq5I1N5wxvVtLQCwQnVR2QqxF
 oAq/ZDnjcpOYqznhfiUrDfh0CK+zKgccpF8QYigmazCjPV/4Daec835r5a71GkmT+/9ny4mqjlN
 1zCm1l5U0Z2J1UofOtF458oVeUOsXVg97B6c3Gq6P8/9lBo934VGvsQQFAPXTLUtyOR5fO5AMiL
 KKrDRFNqxkMx568rC98FsCYI9X6xwjHwidetJFI51hj14AbH62/XNg6k/IZykcRAtAMaNEtINuo
 Q/3279sF1V8NASyS8ZtG/ZrRUXQlUwNZ74YXfNpzrDb6ZFYw1XiWtahYWFg1Nw9tneUPRcKoWps
 NNrqPI+e2/oI48GZ4OI5NkIk6cJdKoP5igdTiWExf6zlqNDBbaG3ObtsJ0Olq9Cf6igjoFcYfnX
 Xc65e8K8xLpaUpT+R7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX1lACLS5ln8rV
 bDcOEFUG+8aNqHRiVSXErMv7aGXRE1LsQCYa+alZDEBJoZQNKmMdummWNk7izqYfkk504LxA+SK
 5UIY2+VSaDVS5b6vOFm9MSykQTEgHFU=
X-Proofpoint-GUID: I_MM6uK8iAORGpJ_aSAm6ISUXKn4hmIx
X-Proofpoint-ORIG-GUID: I_MM6uK8iAORGpJ_aSAm6ISUXKn4hmIx
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eb35 cx=c_pps
 a=7wosIiAuCGbz/5oJp7M3oA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=JJJAxwKGgbaLG8uOhDEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 191 ++++++++++++++++++++++++++----
 include/linux/soc/ti/k3-ringacc.h |  17 +++
 2 files changed, 185 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..2a93e389fb8e0 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -46,6 +46,53 @@ struct k3_ring_rt_regs {
 	u32	hwindx;
 };
 
+#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
+#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
+#define K3_DMARING_CFG_ASEL_SHIFT	16
+#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
+
+/**
+ * struct k3_ring_cfg_regs - The RA Configuration Registers region
+ *
+ * @ba_lo: Ring Base Address Low Register
+ * @ba_hi: Ring Base Address High Register
+ * @size: Ring Size Register
+ */
+struct k3_ring_cfg_regs {
+	u32	ba_lo;
+	u32	ba_hi;
+	u32	size;
+};
+
+#define K3_RINGACC_RT_INT_REGS_OFS		0x140
+#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
+
+/**
+ * struct k3_ring_intr_regs {
+ *
+ * @enable_set: Ring Interrupt Enable Register
+ * @resv_1: Reserved
+ * @clr: Ring Interrupt Clear Register
+ * @resv_2: Reserved
+ * @status_set: Ring Interrupt Status Set Register
+ * @resv_3: Reserved
+ * @status: Ring Interrupt Status Register
+ * @resv_4: Reserved
+ * @status_masked: Ring Interrupt Status Masked Register
+ */
+struct k3_ring_intr_regs {
+	u32	enable_set;
+	u32	resv_1;
+	u32	clr;
+	u32	resv_2;
+	u32	status_set;
+	u32	resv_3;
+	u32	status;
+	u32	resv_4;
+	u32	status_masked;
+};
+
 #define K3_RINGACC_RT_REGS_STEP			0x1000
 #define K3_DMARING_RT_REGS_STEP			0x2000
 #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
@@ -139,6 +186,8 @@ struct k3_ring_state {
  * struct k3_ring - RA Ring descriptor
  *
  * @rt: Ring control/status registers
+ * @cfg: Ring config registers
+ * @intr: Ring interrupt registers
  * @fifos: Ring queues registers
  * @proxy: Ring Proxy Datapath registers
  * @ring_mem_dma: Ring buffer dma address
@@ -158,6 +207,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -467,15 +518,31 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	if (!ringacc->tisci) {
+		u32 reg;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		if (!ring->cfg)
+			return;
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		/* Ensure the register clear operation completes before writing new value */
+		reg = readl(&ring->cfg->size);
+		reg |= ring->size;
+		writel(reg, &ring->cfg->size);
+	} else {
+		ring_cfg.nav_id = ringacc->tisci_dev_id;
+		ring_cfg.index = ring->ring_id;
+		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
+		ring_cfg.count = ring->size;
+
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset(struct k3_ring *ring)
@@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
@@ -576,10 +658,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +767,37 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	if (!ring2->intr)
+		return 0;
+
+	return readl(&ring2->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	if (!ring2->intr)
+		return;
+
+	u32 status = readl(&ring2->intr->status);
+	writel(status, &ring2->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
+
 static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 {
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	if (!ringacc->tisci)
-		return -EINVAL;
-
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
@@ -689,6 +808,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 	ring_cfg.size = ring->elm_size;
 	ring_cfg.asel = ring->asel;
 
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->enable_set);
+		return 0;
+	}
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
@@ -1481,9 +1618,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
 	mutex_init(&ringacc->req_lock);
 
-	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
-	if (IS_ERR(base_rt))
-		return ERR_CAST(base_rt);
+	base_rt = data->base_rt;
+	if (!base_rt) {
+		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(base_rt))
+			return ERR_CAST(base_rt);
+	}
 
 	ringacc->rings = devm_kzalloc(dev,
 				      sizeof(*ringacc->rings) *
@@ -1499,6 +1639,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1656,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		ring->flags = K3_RING_FLAG_REVERSE;
 	}
 
-	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
+	if (ringacc->tisci)
+		ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
 
 	dev_info(dev, "Number of rings: %u\n", ringacc->num_rings);
 
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b925986..9f2d141c988bd 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -158,6 +158,22 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
  */
 int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
 
+/**
+ * k3_ringacc_ring_get_irq_status - Get the irq status for the ring
+ * @ring: pointer on ring
+ *
+ * Returns the interrupt status
+ */
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
+
+/**
+ * k3_ringacc_ring_clear_irq - Clear all interrupts
+ * @ring: pointer on ring
+ *
+ * Clears all the interrupts on the ring
+ */
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -262,6 +278,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
-- 
2.54.0

