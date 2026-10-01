Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A54A6881;
	Thu,  1 Oct 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844120; cv=fail; b=BrSmxsWZFxX+P1ER/QtyOCWIZ5Evb9doW2J1C/F7gJSpNRbiTdPE8GkaXAhoCdCExXxHdwPuO+PsboYy5gTziqUZhafaJ26Q7GXyj3GL14LzmWKbnoMzgw2Um5+0P3JO/qURKCWrIwd0VaNGi89aKXXeXxyQNPC3n4uBNPKCHBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844120; c=relaxed/simple;
	bh=wxhUS9Du+vMDdEYOZ+YhM8yPRYSxCY2AqSwHWr+MAnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HONgvVDECN8AfY9tdI8eA2jKiSL1/EaHtKVcCBvCWZRfD5QjfBsIRESPhSa7CpuZcw2NS9M8+cCuOCIfmHnJcH3XqlQLfC/u4HQwxYv2aJPQMgKyviO/ORLiw0AyXmb7gn6GwhKQVOaFGvZqZ1aR6ZfRJ+8ZnWLpVL0io7YrQA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Va1+P5nf; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=sQ/cZudc; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Va1+P5nf";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="sQ/cZudc"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691710lt1294540;
	Thu, 1 Oct 2026 03:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSW
	RY=; b=Va1+P5nfb6Un+MnCCZTYjzEW6Y+2zM/jfnAgXBno0OCktnTgPWCCj6Lwz
	BfEBpy6ur+5GFHOup6EMJBqkzYmyZwzVB9pKpWtZ+3aQT6fp4NE1wGO/ef2ZP7+1
	m8zj8y5CW/MIdfMWzFn4wrK/GKKsyM5GegbahEcP7sy3Efly+k0bv24Cxp5GGHFL
	hJ5Qk/92rT4sFDN08ZxYzavKGJzROoOnAHnA4JvV9qt/DNldFWQqe6t5vVPt+Ajs
	o5sBGW6/4GLdqWQWaaykNqtTE3xJs8CElj+a3l1Tyem+qP0ItpzotyBzfL52++cG
	7Z57M5nRuLk8J/nLjzjjn3Rqy3QGw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h1eur9pn7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:41:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEphz9keXtpL79AbJyNWQIdWeXy486or/9PzD5uOi56rU5nAMrcy2M+ogmC2hitNC8kAiEfDDbtq2bwcrUN21uGCoEmoiVc4iJm4icYnQEpCzVb8HiMb2k26aXsk18k6YCrunWPMJABjfgHaDYl5OqQw97vK/PqmK8ZtsjwcpiZVDq+Vfqy8n8jG9/wqnWU0PZi5Q4qTSs7+F/8lwT5Q9bLEw9IEs2k14ZlF1lDMui7+MOftWrJqtRRxduHBXDApVoIfJFvPhBPj9iyvIhd15kl5/zisDDbk7LKXwDZTZQsi6az1vXAn1UV+ex4TwOXtbKIXSbOeUWADeFAw4GXAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSWRY=;
 b=Zsf6dsWgWMLZE70Wv0CVlVogQa4TGypAx1l61nC8zNnY1C9v8PU7EPe5+n8erh28lNklJ9rT4aI9KPTnX7fLX7q2bmnThU0syyrI2dX5LvUZNjZT7RfD+eMvEFqyGDiW9ceV7Ml6OKDf6R9JPKX1noNxqXR0ZjC1F22qpwLxZ4ImZVZsOBgGOluryhaCtwClZ4/hQewn+po0K3MHe29A/LMm4alfNnUrOkWNOqRFkUqFDcMvfF4A1AofdAZdGWIscbCIs7tpywJgM3xQ3JCdneAgaMaW5sJB7YmpgvE/cSTdSmjiFXumLzcTy2sAXGHOYUJHWHmvYV2n6WpHrRveVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSWRY=;
 b=sQ/cZudcO3pIf9dFOwNsW9hGoArT7pUEY7o3auhrjjqQlKGAY1mGAmXc4AucPyoY/Z6XhXYTHQ2tWsRTzJvvyxICcanctKxGxy2bJ0nUMbubz7+waLwTHqxGXsMZMyhkW2eOwtyLHTm5JynkqMtIWbQH6bpKktgxFQxpzQG2LCw=
Received: from BN9PR03CA0688.namprd03.prod.outlook.com (2603:10b6:408:10e::33)
 by BN0PR10MB4885.namprd10.prod.outlook.com (2603:10b6:408:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:41:39 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::23) by BN9PR03CA0688.outlook.office365.com
 (2603:10b6:408:10e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:41:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:41:39 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:28 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:28 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rs630551;
	Thu, 1 Oct 2026 03:41:23 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 03/19] dmaengine: ti: k3-udma: move structs and enums to header file
Date: Thu, 1 Oct 2026 14:10:19 +0530
Message-ID: <20261001084105.1692228-4-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|BN0PR10MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: e1051d2a-cb2a-464a-dc49-08df1f97cfcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|921020|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wIdB3k5whUPe2ggeaWLwAa3Fxf/WIw1uQmZLiZke7yq1TNIfTzfwmyFZUP0pLy0MuSywvUExByBc3N8yS+2oUNkpSV9Daxxbx/N+6Csj4MBT/ZX0DBS5PFamXiZ6Ig1TegZwvmlQpsxlHwQiYKNjSWGZ0f/T/wSoSg4hzs0ZV1QILV0+o9+HQSniA7pTcaOgNEwMgITTCvij3hQlgJm2F6PUV5EVRmBZmPUmp3dbW2ysSFwE8RfHvEgoN8QdIkaN2LZSaOhhx2P/ZgpR+UeCakCr2azcAdvS5jIiEXv2sq3DRJEGQAQJtCZgs8EIhnB2Xx0QLOmQid5ZUcN3r5LlJAlkYPaHUBkfQQ3nFLCvazNytHFrxT7D/uJxzs1Qk6B/bRMHg8jjCRH9hm/+rjsyIdgncG4gDtKnlp+J9xsGReU0nZV5LD0euWDq4LnliifhjnvV5EnnHRaifqNg4Rw4g6JIgRJg0oC/yRv7I02UaWdqRP9rgI2VECgQYDkUTmfLi7EnX7Kjqk+RJKyXuiX0g69qdq7/scJatd6J02EPOr9kBe4EM4bkKRINxYzdGOB7web4NjPtX1bPsoaDp6yt5JZabz1E5P0/v/sVLFbmT/1UZx3UVq1A+0i+qdjSGgt6WHY9W7rxp/yEKpjg8L9udGHbXGFoLBcMg5MkVlBnBAzVgEenoA0GVZH813hI5e8L6iFQAB9LgOsxbcV5Du98nuSofsNHE1gXultpSBh0hknun+z7GMKvZQbh8nKbns5x
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(921020)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bFCF2TZ3PESO1i0WARFYUAn1VAw/qf+kjmIBx66oGWRHrQeF7v74vD/DOlqiFH6zSppNS0OiWIMEaHzGrSzA4ETyiPrA26cboD77Q5oc9wqU4cZpom1P5pTCs4Ue4tLnUtbzZnw9iSlUPrTfR61FD2BSxeQQcT9UKxRJEcsKng8UwnVp7Zmzr8UTUSutWA0f+7vULLq8dpV9+hCOSfTxAU6HVB3EaBD1umUZCsPmvzX8M+86XCXL3+/RlvWHtXvfsnkjJGxeLZqdFVUFhOO+axNvnnxuXZamBitp0B1Rz53IpLMMCHqBQ2ai5McnvLJiJLIywqLEwrHlXgsz2M8bx7/DwtI/Hq7/cUmflUaLCqA1S5wyM6yIcir7oQvv7K3EJkxOX1LtFD8O2FCnEzowW9WE+ZmvCLGAK8rDzuHRnUkaN66+Qk06r3W7gBE801e1
X-Exchange-RoutingPolicyChecked:
	GYQKi7BTWVGkXANWC7758hJ21FfXf6Ggxc0biptLJnM3c7wyRFsQJhEWqZQIl1rchzwgvI+tCFyhvRjhWipizcb1sCTkRXCpDEcMqtaWnhZm2n6xawbYgqMt2IqZsXgmbJha5Fy4WeKgdZAMJPjpn7hK8EmXh5o/e3KtUDS+Jfre+Qc00pDljs3Of3HqEg3RG9WbfM4NOiiDt6ZWGsFr4lNREebl8EIjba1Yn+HTGzioYqVKSrE2EeHASFJyhnc/dJ39ExzwgxyhcruY8MKzAJtZaTN4GtQJGcKnLixegl6UL16t8gmtONO/uVJsPdBU3+/wktfruq0yp2v5KN/A6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:41:39.5576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1051d2a-cb2a-464a-dc49-08df1f97cfcc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4885
X-Proofpoint-GUID: 7K-5uB2tENzEAJgkxP1mVkM1mewYln4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX1qCG3WvAn/iu
 0YGUeh4VGucvAwSR8jGEAgwOxMd9+aRRvEUnAcUnmAJEvM4bNncLcKokgn3Tl6nF4NK6u9dQWud
 RlD8tbFHqwWYYnhure7gOmrIggZr3PD+LB4J+xFXq1BxZJOi4DMPJdDvUsl/ak62hPgBG6Z9DbB
 O62TrV6rVrTqv/3MMI3HZZ2vUpcKJWQnI0139KyUgCF/vApTuYVZweJtAy03BMn2V5Mpy7qchXG
 TthgHKFKLPkI4s+0UW/bCVO6/m1fRkO8QVML/j+PMdS3rl4eMIeTf27+KNadP0isFNH1YqMhWWZ
 Nl88ykURNuBJ8gqaeO7gtEHKST2T4VyzfMhyQQ8yFO/p+eq+j+qLbDg0zrbZPh2jk8Ids5tYdBn
 5UFoEmrc9I+fqaISJkr1fpG0pH7IWhUIiLZ3ch8QXDQFHQrMB7XGDYv9bIOX27x8BdgmMsXVaDY
 ebD23uST1RKHrNlhpKQ==
X-Authority-Analysis: v=2.4 cv=KvzYSmWN c=1 sm=1 tr=0 ts=6abe1cc7 cx=c_pps
 a=6O9SViV89A8ZJb2Gg0v8VA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=8AirrxEcAAAA:8
 a=1JpllqVW-1LRWXCuGuAA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 7K-5uB2tENzEAJgkxP1mVkM1mewYln4D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxQwLCBVpt6M4
 tSSQWEzO8ZD6Cmcgu5D+Ava0JGwuAubnrdW+gSxPrFFk+aGqGsAcvh9evrMLmLv89kGdQ++37yp
 1yJu9+etv6VEqXEHPvgCpf3czphc9sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Move struct and enum definitions in k3-udma.c to k3-udma.h header file
for better separation and reuse.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ti/k3-udma.c | 259 +-------------------------------------
 drivers/dma/ti/k3-udma.h | 265 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 266 insertions(+), 258 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a1b99097a94ad..d7c153c5321ea 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -24,8 +24,8 @@
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/soc/ti/k3-ringacc.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/dma/k3-event-router.h>
 #include <linux/dma/ti-cppi5.h>
 
@@ -33,28 +33,6 @@
 #include "k3-udma.h"
 #include "k3-psil-priv.h"
 
-struct udma_static_tr {
-	u8 elsize; /* RPSTR0 */
-	u16 elcnt; /* RPSTR0 */
-	u16 bstcnt; /* RPSTR1 */
-};
-
-struct udma_chan;
-
-enum k3_dma_type {
-	DMA_TYPE_UDMA = 0,
-	DMA_TYPE_BCDMA,
-	DMA_TYPE_PKTDMA,
-};
-
-enum udma_mmr {
-	MMR_GCFG = 0,
-	MMR_BCHANRT,
-	MMR_RCHANRT,
-	MMR_TCHANRT,
-	MMR_LAST,
-};
-
 static const char * const mmr_names[] = {
 	[MMR_GCFG] = "gcfg",
 	[MMR_BCHANRT] = "bchanrt",
@@ -62,234 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-struct udma_tchan {
-	void __iomem *reg_rt;
-
-	int id;
-	struct k3_ring *t_ring; /* Transmit ring */
-	struct k3_ring *tc_ring; /* Transmit Completion ring */
-	int tflow_id; /* applicable only for PKTDMA */
-
-};
-
-#define udma_bchan udma_tchan
-
-struct udma_rflow {
-	int id;
-	struct k3_ring *fd_ring; /* Free Descriptor ring */
-	struct k3_ring *r_ring; /* Receive ring */
-};
-
-struct udma_rchan {
-	void __iomem *reg_rt;
-
-	int id;
-};
-
-struct udma_oes_offsets {
-	/* K3 UDMA Output Event Offset */
-	u32 udma_rchan;
-
-	/* BCDMA Output Event Offsets */
-	u32 bcdma_bchan_data;
-	u32 bcdma_bchan_ring;
-	u32 bcdma_tchan_data;
-	u32 bcdma_tchan_ring;
-	u32 bcdma_rchan_data;
-	u32 bcdma_rchan_ring;
-
-	/* PKTDMA Output Event Offsets */
-	u32 pktdma_tchan_flow;
-	u32 pktdma_rchan_flow;
-};
-
-struct udma_match_data {
-	enum k3_dma_type type;
-	u32 psil_base;
-	bool enable_memcpy_support;
-	u32 flags;
-	u32 statictr_z_mask;
-	u8 burst_size[3];
-	struct udma_soc_data *soc_data;
-};
-
-struct udma_soc_data {
-	struct udma_oes_offsets oes;
-	u32 bcdma_trigger_event_offset;
-};
-
-struct udma_hwdesc {
-	size_t cppi5_desc_size;
-	void *cppi5_desc_vaddr;
-	dma_addr_t cppi5_desc_paddr;
-
-	/* TR descriptor internal pointers */
-	void *tr_req_base;
-	struct cppi5_tr_resp_t *tr_resp_base;
-};
-
-struct udma_rx_flush {
-	struct udma_hwdesc hwdescs[2];
-
-	size_t buffer_size;
-	void *buffer_vaddr;
-	dma_addr_t buffer_paddr;
-};
-
-struct udma_tpl {
-	u8 levels;
-	u32 start_idx[3];
-};
-
-struct udma_dev {
-	struct dma_device ddev;
-	struct device *dev;
-	void __iomem *mmrs[MMR_LAST];
-	const struct udma_match_data *match_data;
-	const struct udma_soc_data *soc_data;
-
-	struct udma_tpl bchan_tpl;
-	struct udma_tpl tchan_tpl;
-	struct udma_tpl rchan_tpl;
-
-	size_t desc_align; /* alignment to use for descriptors */
-
-	struct udma_tisci_rm tisci_rm;
-
-	struct k3_ringacc *ringacc;
-
-	struct work_struct purge_work;
-	struct list_head desc_to_purge;
-	spinlock_t lock;
-
-	struct udma_rx_flush rx_flush;
-
-	int bchan_cnt;
-	int tchan_cnt;
-	int echan_cnt;
-	int rchan_cnt;
-	int rflow_cnt;
-	int tflow_cnt;
-	unsigned long *bchan_map;
-	unsigned long *tchan_map;
-	unsigned long *rchan_map;
-	unsigned long *rflow_gp_map;
-	unsigned long *rflow_gp_map_allocated;
-	unsigned long *rflow_in_use;
-	unsigned long *tflow_map;
-
-	struct udma_bchan *bchans;
-	struct udma_tchan *tchans;
-	struct udma_rchan *rchans;
-	struct udma_rflow *rflows;
-
-	struct udma_chan *channels;
-	u32 psil_base;
-	u32 atype;
-	u32 asel;
-};
-
-struct udma_desc {
-	struct virt_dma_desc vd;
-
-	bool terminated;
-
-	enum dma_transfer_direction dir;
-
-	struct udma_static_tr static_tr;
-	u32 residue;
-
-	unsigned int sglen;
-	unsigned int desc_idx; /* Only used for cyclic in packet mode */
-	unsigned int tr_idx;
-
-	u32 metadata_size;
-	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
-
-	unsigned int hwdesc_count;
-	struct udma_hwdesc hwdesc[];
-};
-
-enum udma_chan_state {
-	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
-	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
-	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
-};
-
-struct udma_tx_drain {
-	struct delayed_work work;
-	ktime_t tstamp;
-	u32 residue;
-};
-
-struct udma_chan_config {
-	bool pkt_mode; /* TR or packet */
-	bool needs_epib; /* EPIB is needed for the communication or not */
-	u32 psd_size; /* size of Protocol Specific Data */
-	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
-	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
-	bool notdpkt; /* Suppress sending TDC packet */
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 src_thread;
-	u32 dst_thread;
-	enum psil_endpoint_type ep_type;
-	bool enable_acc32;
-	bool enable_burst;
-	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
-
-	u32 tr_trigger_type;
-	unsigned long tx_flags;
-
-	/* PKDMA mapped channel */
-	int mapped_channel_id;
-	/* PKTDMA default tflow or rflow for mapped channel */
-	int default_flow_id;
-
-	enum dma_transfer_direction dir;
-};
-
-struct udma_chan {
-	struct virt_dma_chan vc;
-	struct dma_slave_config	cfg;
-	struct udma_dev *ud;
-	struct device *dma_dev;
-	struct udma_desc *desc;
-	struct udma_desc *terminated_desc;
-	struct udma_static_tr static_tr;
-	char *name;
-
-	struct udma_bchan *bchan;
-	struct udma_tchan *tchan;
-	struct udma_rchan *rchan;
-	struct udma_rflow *rflow;
-
-	bool psil_paired;
-
-	int irq_num_ring;
-	int irq_num_udma;
-
-	bool cyclic;
-	bool paused;
-
-	enum udma_chan_state state;
-	struct completion teardown_completed;
-
-	struct udma_tx_drain tx_drain;
-
-	/* Channel configuration parameters */
-	struct udma_chan_config config;
-	/* Channel configuration parameters (backup) */
-	struct udma_chan_config backup_config;
-
-	/* dmapool for packet mode descriptors */
-	bool use_dma_pool;
-	struct dma_pool *hdesc_pool;
-
-	u32 id;
-};
-
 static inline struct udma_dev *to_udma_dev(struct dma_device *d)
 {
 	return container_of(d, struct udma_dev, ddev);
@@ -4073,13 +3823,6 @@ static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
 
-struct udma_filter_param {
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 tr_trigger_type;
-};
-
 static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct udma_chan_config *ucc;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 750720cd06911..11d08adb0d69f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -6,7 +6,16 @@
 #ifndef K3_UDMA_H_
 #define K3_UDMA_H_
 
+#include <linux/dmaengine.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+#include "../virt-dma.h"
+#include "k3-psil-priv.h"
 
 /* Global registers */
 #define UDMA_REV_REG			0x0
@@ -164,6 +173,7 @@ struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
 struct udma_rflow;
+struct udma_chan;
 
 enum udma_rm_range {
 	RM_RANGE_BCHAN = 0,
@@ -186,6 +196,261 @@ struct udma_tisci_rm {
 	struct ti_sci_resource *rm_ranges[RM_RANGE_LAST];
 };
 
+struct udma_static_tr {
+	u8 elsize; /* RPSTR0 */
+	u16 elcnt; /* RPSTR0 */
+	u16 bstcnt; /* RPSTR1 */
+};
+
+enum k3_dma_type {
+	DMA_TYPE_UDMA = 0,
+	DMA_TYPE_BCDMA,
+	DMA_TYPE_PKTDMA,
+};
+
+enum udma_mmr {
+	MMR_GCFG = 0,
+	MMR_BCHANRT,
+	MMR_RCHANRT,
+	MMR_TCHANRT,
+	MMR_LAST,
+};
+
+struct udma_filter_param {
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 tr_trigger_type;
+};
+
+struct udma_tchan {
+	void __iomem *reg_rt;
+
+	int id;
+	struct k3_ring *t_ring; /* Transmit ring */
+	struct k3_ring *tc_ring; /* Transmit Completion ring */
+	int tflow_id; /* applicable only for PKTDMA */
+
+};
+
+#define udma_bchan udma_tchan
+
+struct udma_rflow {
+	int id;
+	struct k3_ring *fd_ring; /* Free Descriptor ring */
+	struct k3_ring *r_ring; /* Receive ring */
+};
+
+struct udma_rchan {
+	void __iomem *reg_rt;
+
+	int id;
+};
+
+struct udma_oes_offsets {
+	/* K3 UDMA Output Event Offset */
+	u32 udma_rchan;
+
+	/* BCDMA Output Event Offsets */
+	u32 bcdma_bchan_data;
+	u32 bcdma_bchan_ring;
+	u32 bcdma_tchan_data;
+	u32 bcdma_tchan_ring;
+	u32 bcdma_rchan_data;
+	u32 bcdma_rchan_ring;
+
+	/* PKTDMA Output Event Offsets */
+	u32 pktdma_tchan_flow;
+	u32 pktdma_rchan_flow;
+};
+
+struct udma_match_data {
+	enum k3_dma_type type;
+	u32 psil_base;
+	bool enable_memcpy_support;
+	u32 flags;
+	u32 statictr_z_mask;
+	u8 burst_size[3];
+	struct udma_soc_data *soc_data;
+};
+
+struct udma_soc_data {
+	struct udma_oes_offsets oes;
+	u32 bcdma_trigger_event_offset;
+};
+
+struct udma_hwdesc {
+	size_t cppi5_desc_size;
+	void *cppi5_desc_vaddr;
+	dma_addr_t cppi5_desc_paddr;
+
+	/* TR descriptor internal pointers */
+	void *tr_req_base;
+	struct cppi5_tr_resp_t *tr_resp_base;
+};
+
+struct udma_rx_flush {
+	struct udma_hwdesc hwdescs[2];
+
+	size_t buffer_size;
+	void *buffer_vaddr;
+	dma_addr_t buffer_paddr;
+};
+
+struct udma_tpl {
+	u8 levels;
+	u32 start_idx[3];
+};
+
+struct udma_dev {
+	struct dma_device ddev;
+	struct device *dev;
+	void __iomem *mmrs[MMR_LAST];
+	const struct udma_match_data *match_data;
+	const struct udma_soc_data *soc_data;
+
+	struct udma_tpl bchan_tpl;
+	struct udma_tpl tchan_tpl;
+	struct udma_tpl rchan_tpl;
+
+	size_t desc_align; /* alignment to use for descriptors */
+
+	struct udma_tisci_rm tisci_rm;
+
+	struct k3_ringacc *ringacc;
+
+	struct work_struct purge_work;
+	struct list_head desc_to_purge;
+	spinlock_t lock;
+
+	struct udma_rx_flush rx_flush;
+
+	int bchan_cnt;
+	int tchan_cnt;
+	int echan_cnt;
+	int rchan_cnt;
+	int rflow_cnt;
+	int tflow_cnt;
+	unsigned long *bchan_map;
+	unsigned long *tchan_map;
+	unsigned long *rchan_map;
+	unsigned long *rflow_gp_map;
+	unsigned long *rflow_gp_map_allocated;
+	unsigned long *rflow_in_use;
+	unsigned long *tflow_map;
+
+	struct udma_bchan *bchans;
+	struct udma_tchan *tchans;
+	struct udma_rchan *rchans;
+	struct udma_rflow *rflows;
+
+	struct udma_chan *channels;
+	u32 psil_base;
+	u32 atype;
+	u32 asel;
+};
+
+struct udma_desc {
+	struct virt_dma_desc vd;
+
+	bool terminated;
+
+	enum dma_transfer_direction dir;
+
+	struct udma_static_tr static_tr;
+	u32 residue;
+
+	unsigned int sglen;
+	unsigned int desc_idx; /* Only used for cyclic in packet mode */
+	unsigned int tr_idx;
+
+	u32 metadata_size;
+	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
+
+	unsigned int hwdesc_count;
+	struct udma_hwdesc hwdesc[];
+};
+
+enum udma_chan_state {
+	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
+	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
+	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
+};
+
+struct udma_tx_drain {
+	struct delayed_work work;
+	ktime_t tstamp;
+	u32 residue;
+};
+
+struct udma_chan_config {
+	bool pkt_mode; /* TR or packet */
+	bool needs_epib; /* EPIB is needed for the communication or not */
+	u32 psd_size; /* size of Protocol Specific Data */
+	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
+	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
+	bool notdpkt; /* Suppress sending TDC packet */
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 src_thread;
+	u32 dst_thread;
+	enum psil_endpoint_type ep_type;
+	bool enable_acc32;
+	bool enable_burst;
+	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
+
+	u32 tr_trigger_type;
+	unsigned long tx_flags;
+
+	/* PKDMA mapped channel */
+	int mapped_channel_id;
+	/* PKTDMA default tflow or rflow for mapped channel */
+	int default_flow_id;
+
+	enum dma_transfer_direction dir;
+};
+
+struct udma_chan {
+	struct virt_dma_chan vc;
+	struct dma_slave_config	cfg;
+	struct udma_dev *ud;
+	struct device *dma_dev;
+	struct udma_desc *desc;
+	struct udma_desc *terminated_desc;
+	struct udma_static_tr static_tr;
+	char *name;
+
+	struct udma_bchan *bchan;
+	struct udma_tchan *tchan;
+	struct udma_rchan *rchan;
+	struct udma_rflow *rflow;
+
+	bool psil_paired;
+
+	int irq_num_ring;
+	int irq_num_udma;
+
+	bool cyclic;
+	bool paused;
+
+	enum udma_chan_state state;
+	struct completion teardown_completed;
+
+	struct udma_tx_drain tx_drain;
+
+	/* Channel configuration parameters */
+	struct udma_chan_config config;
+	/* Channel configuration parameters (backup) */
+	struct udma_chan_config backup_config;
+
+	/* dmapool for packet mode descriptors */
+	bool use_dma_pool;
+	struct dma_pool *hdesc_pool;
+
+	u32 id;
+};
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

