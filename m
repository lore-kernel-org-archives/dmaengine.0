Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9735418A46;
	Tue, 22 Sep 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059829; cv=fail; b=ZU+eKYlowTk8ghEnrsn3PoRr7lKNqyXP5kw/xiyxLAFXVgagYp6l8kTe8sP2IxopNup6yCcy9lfXD0wrqw/7hIeiyXCCN5ocq5toB8y9afBGYUTjIL2Zxrg9YyF1a165udhTM3SK8xxsBFqUxuV0fLEJxWdQNMq0puFPLsjZjhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059829; c=relaxed/simple;
	bh=RW+PqzSQ5WvJoIsZ7JEixWn8SAb1EUozaq6kISlvTK4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIeocHzFGsu8WUENMfGmEBFOJBL4UTCzdehMD9llPSz7z0WuRwFuyIl9gSJB3pTrWkfpE6GYdXwS3IaudyhSh0xbLxJpRmiLZwsC1GREHFPySsN+beU4H9PL8EiTF4PMlikTf30hcZ+HQSwD2IRr03WjopY4Cw8CgVARC0sw8iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nVkGJ081; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FCWv1pPJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nVkGJ081";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FCWv1pPJ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UKot1034864;
	Tue, 22 Sep 2026 01:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tK
	eI=; b=nVkGJ081ElBVWLwRzKBAFfHOTWSUmafm8RO+29WJECFsR42amIZ7B6VWm
	Ebi8CvrGm6KhRkjN4kGB9bn0RZ7ZW1bM1hlZQ9+JcOtSZO1ni3uhX9WEUCMq0ngx
	zwU6hrlahYl/idw0T1F/Fj0vhRF0+CIgZAyu1vOps7FB4z9ilTGWpivWQmCxw0Rf
	+C07xLe2m2JKNDlxTvk96Jf0RwNHTXbZNKiYHTZ1UULTdz0MgRKT5aYJ7Eqn8PLu
	DFMr1mIKdXwYzOxeUmej3bhtAwOeeyUR+wLqSAkFjQaLPHsUoZPqQhjS/ZvGUWRw
	a/7FHJ9CtqHOvAuHLl3S7vR40Oc5A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16kg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIM2VX5jr/eIHt35T4iuW29seoTVpkW5g6ZnNOjXxBO/EsKEM2nTcCeM04GMnmpwt0arEY3YPiHtZwhKy3NyrgtngTPB1dARThEirvqr1XdnIX3WU4Rgdu5/QKD2CUhMzQ/IZdsum7Yidt6MEGOMU8fBTbKOIL9eygnRamjvF2Y/9atiH7d9+7pJ3kLwrfhoCHJvGX+VbkmK2ckpf0+SNcJv8phdaqwwNtsZxaJ56OibPCcFhY20lsrw3VEywg5+wM2dt4bCXkFVyKoYBbCU3Z7qAjxZXQ3QQt/2L8afHqF6ksEsfqtDL9syqQGPst3Tov+wrSyWKb4XvKTcSiWRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tKeI=;
 b=AdHu9Qim1TxwO9PZY9c/yyY3eKtz9St4OEE9CH4Yf8pgSlK7qfpWmJkdY/797EYqD5G3H5uHJXrzdNi/LrI/OwJibu8vYVG0N7WM5eqzAAzz6Zp9pMGJSyg+B7VqDPvd8Aib6wwFVa9WN/jJHTIfXU6el0sMzlHhyBcxNuNYqq+0a5na5cV6fpMgDG+geL2sXBCscZJcILHJDzkOaZOhhnGQdvBjOCvOf/folItwTn7WV3MxeV3ACHpL/0t5YY+ajvzRoBYHIobvCU77Na98Xd7nzFBL3DeivcCQqsDeyKof9UryQRN5ZYc+7/d+EHkaMIplMDjvJtO7miVdFaFnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tKeI=;
 b=FCWv1pPJLb8ojhJJia+dP2ELureEvaKP87b+cOumvJ7xnfkxxJuv+fuuMyq2iTjG98C54LYCQ/v3EaIKBT0wkjpIaSMveeE1iWAfqnPHYgl7ICnKSHWgrD2M6hYMVBY4iFrd+mcr3xq2ypdnY4C7BuRG11AHxKiPi895CxiKiSw=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by CO1PR10MB4785.namprd10.prod.outlook.com (2603:10b6:303:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:13 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::82) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 06:50:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:58 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:58 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3x3626771;
	Tue, 22 Sep 2026 01:49:53 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 07/19] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Tue, 22 Sep 2026 12:17:31 +0530
Message-ID: <20260922064902.2719979-8-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CO1PR10MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 71207e83-d5d5-4711-bfcd-08df1875c0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|7416014|36860700016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KBo4qDI4aQYFrjhyXyj8IwDp+PTRhipDeIpW/294VtWmcHhqoHeT3yh2MythlTtztTitm/qMX8O9FPO74mDe4rsNco1rs4nWn4fUFrP4taGegCzPRe9TFd7BfXw7JphQNoHvh3eJX3h74NCUsIvKZBhEgWrnxJlNFyXTF4zmrTVkwl1duO7KC3WxUcNv4aW+K8XryMOQI/TrVcNiqKnlzBNuswL0QtngaQpO/DTUwAbZ6eR+lHXfkngMOvxB5QZ4/aZ1uAQUKS19rhKduIH8/lGjU6ed66l8HIGNX3d6o+5rUD4g70ttzvRM2SnO3BWHLoil3YfK7lJnEVhFsC0b0hK8weO0EzSbWQETuSN5JAjIAlUFOQzsFDaW8E3hBqoGRgtCczy+KJ1BRdbV6lLapMpPDYrD5qYWakgkLLgw61b0vsZ8le8qX0ztn6lPfCxkAPJS7KVUnmoQR5ox7NwWAwO52u+FpncGYK81q3BYe+cirrF/YGVAysaB14YWlXzXHLD6nNnpAbZ80tuUAqpg4vJSMmuQmuImyDXTdPmq5M/TTktIOaaVynTnMOtZ6bSl1aGSJB23b+LgmFCznrRyi3xcoOc7H/ZeULE4ZFFqUgGnx3pPsngflo3ZqImtqVqb7jGrHJYpEl2sQkXahBJ4dd5CA6RrPUYag0i1TOk/ahfbknMSX/CbCrpUxyNv3eOcb5POK5+QgNGfZ4hJlk4QZ2fi2vNdqkHuHtHGLyaAnw8HerMhfWCXv/6m5H7Jevce
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(7416014)(36860700016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NWEzyxGHQJGWd24bbuGndGUmdl4yL3Cl4XHi3cOlvxR3/77SS2p2/VFhkv2WUZvHrmo5+m8TDZpHfmkf0pUvQiH28mNd03cv0UrHqh9uAey/7NK+E9xDLFwumbShmvRc2dYEZX87R0k5dB+IkdVraLHiJN3TRoHQL2EtlRYiBsaYEBzSXR9cW5g+262tEmgefNhvUpzkgCCAk2AwCg1k2KSQNlIBqudR1cNxyUvNXJQ7zI6Glo3Ig8eFFJeWxUPl+UiBYeJKl0bfo7Ix8UVVWV5d+z0WdEAxTiUDl+MeqKwUWc56etXSChWcRf1paq+FcnUZ67AAoAHFvEDo0PMGpNqGSnP8yEms/66avp61VILTv2UeZP2NN3aAZdjKqpRsVBfnHDgkQiLVqTaMKi49/Gv7TQr4ByeoECEmGvqYS2qYa/aIrurtAiAMRM1KHrLU
X-Exchange-RoutingPolicyChecked:
	DnYkZvaYzZVWVqQTntV1yFL6dkCmd+G1rOvNiy2NhLy+xwaIWtwHNtomtV326wmpV7a3WnLRgnAP7V8sioyNcQcH958yDmPQYLQzw06MKNK/kycMxDE21REwfQ7J6uDlZ160nxnN5YA3cy1iHOcUsZob+yWo2x6lR7pTxsaiTwhcxlWQwpbPmjzXAJv3ag0irHGXmRd5SdPkaviT7CWyimVkugkgklz50P035ublbhK2V3eVzCMck0P+nqFcZOUSrvo5dAhcOpD+R0bxUjdLPRrnUfPrCCFVhXkbQ/zzlF4vNJoawotdBVtnoU3NqAl5XyZtj4M0k7rmIlLQUm+IGA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:13.1356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71207e83-d5d5-4711-bfcd-08df1875c0ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4785
X-Proofpoint-ORIG-GUID: c0DURkEvOojVAkV3Lx1BA1VOJoQW8Mnj
X-Proofpoint-GUID: c0DURkEvOojVAkV3Lx1BA1VOJoQW8Mnj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXyxF+iIZt1LAn
 Ehc5zHhGtx1YqbDnQSqnV9thBu1+VgPkHTZcgpMr18fM9QyLpK0T8iJT1hk+uYgFo6xayiYQQhZ
 NvZG9LXK2kZsOn4zg9Guwhaj8C9BCbupM+jTZjl3nvJiwxxZ2sKJnWOnDJTG9DmbQPTlvtKjTqE
 cN3q9UscOhkQSRSZVYf3GohOhdPszLak4BQlvbSAI7NW7/lpYXZc5hscnGPrZoniIBbs+FJC+b4
 DKoBmfeLJLkOjRjTpzZCEFfjLbkPVk3Eo0Mumgd3gWxjTOgqqqGhot9Yfn4roEz417ghlqieSZ9
 XokFKwTlnoNEoQrPaF9ArE7qnEJOTht6wl2VbHH3+nls5NGC7L8wM9rE66N4RxTOmoRUtcdhv1B
 22Xsn57xYD/CR+rndgvnVFK/osko+9Arfd8kDPo7PK7tRucAjyCwN4QDbVVaPOyaHaRrpMxkAd2
 HO7OMcTBFaf5Enx7fEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX6zNy6eGMm30O
 +3AyhrQW9v1lH+ku3jhvL/1f0irn5OKsSR3cVQD8VMs4lEaILJENGg71BfWfGOvlIi8bEa7Fu7B
 s/jzEklRUG/5GmDq9eoNPY8PkkFPL4A=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22529 cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=G_UKfOQgHLmTBcQ1_a4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

No functional changes intended in this commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-private.c | 10 ++++-
 drivers/dma/ti/k3-udma.c         | 66 ++++++++++++++++++--------------
 drivers/dma/ti/k3-udma.h         | 12 ++++++
 3 files changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 624360423ef17..44c097fff5ee6 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -8,13 +8,19 @@
 
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_pair(ud, src_thread, dst_thread);
+	if (ud->psil_pair)
+		return ud->psil_pair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_pair);
 
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_unpair(ud, src_thread, dst_thread);
+	if (ud->psil_unpair)
+		return ud->psil_unpair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_unpair);
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 6a731fcfc0697..36dcc888815ea 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,7 +40,7 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -50,8 +50,8 @@ static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 					      src_thread, dst_thread);
 }
 
-static int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-			     u32 dst_thread)
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
+		      u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -329,7 +329,7 @@ static int udma_start(struct udma_chan *uc)
 	}
 
 	/* Make sure that we clear the teardown bit, if it is set */
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 
 	/* Push descriptors before we start the channel */
 	udma_start_desc(uc);
@@ -521,8 +521,8 @@ static void udma_check_tx_completion(struct work_struct *work)
 		if (uc->desc) {
 			struct udma_desc *d = uc->desc;
 
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 			break;
 		}
@@ -554,7 +554,7 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 		}
 
 		if (!uc->desc)
-			udma_start(uc);
+			uc->ud->start(uc);
 
 		goto out;
 	}
@@ -576,8 +576,8 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 				vchan_cyclic_callback(&d->vd);
 			} else {
 				if (udma_is_desc_really_done(uc, d)) {
-					udma_decrement_byte_counters(uc, d->residue);
-					udma_start(uc);
+					uc->ud->decrement_byte_counters(uc, d->residue);
+					uc->ud->start(uc);
 					vchan_cookie_complete(&d->vd);
 				} else {
 					schedule_delayed_work(&uc->tx_drain.work,
@@ -612,8 +612,8 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else {
 			/* TODO: figure out the real amount of data */
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 		}
 	}
@@ -1654,7 +1654,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1663,7 +1663,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -1718,7 +1718,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_ring = 0;
 	uc->irq_num_udma = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -1821,7 +1821,7 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1849,8 +1849,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 		uc->use_dma_pool = true;
 	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
 		/* PSI-L pairing */
-		ret = navss_psil_pair(ud, uc->config.src_thread,
-				      uc->config.dst_thread);
+		ret = ud->psil_pair(ud, uc->config.src_thread,
+				    uc->config.dst_thread);
 		if (ret) {
 			dev_err(ud->dev,
 				"PSI-L pairing failed: 0x%04x -> 0x%04x\n",
@@ -1910,8 +1910,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_udma = 0;
 err_psi_free:
 	if (uc->psil_paired)
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	bcdma_free_bchan_resources(uc);
@@ -2014,7 +2014,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2037,7 +2037,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->use_dma_pool = true;
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -2083,7 +2083,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 err_irq_free:
 	uc->irq_num_ring = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -2123,7 +2123,7 @@ static void udma_issue_pending(struct dma_chan *chan)
 		 */
 		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
 		      udma_is_chan_running(uc)))
-			udma_start(uc);
+			uc->ud->start(uc);
 	}
 
 	spin_unlock_irqrestore(&uc->vc.lock, flags);
@@ -2265,7 +2265,7 @@ static int udma_terminate_all(struct dma_chan *chan)
 	spin_lock_irqsave(&uc->vc.lock, flags);
 
 	if (udma_is_chan_running(uc))
-		udma_stop(uc);
+		uc->ud->stop(uc);
 
 	if (uc->desc) {
 		uc->terminated_desc = uc->desc;
@@ -2297,11 +2297,11 @@ static void udma_synchronize(struct dma_chan *chan)
 			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
 				 uc->id);
 			udma_dump_chan_stdata(uc);
-			udma_reset_chan(uc, true);
+			uc->ud->reset_chan(uc, true);
 		}
 	}
 
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 	if (udma_is_chan_running(uc))
 		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
 
@@ -2355,7 +2355,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	udma_terminate_all(chan);
 	if (uc->terminated_desc) {
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		udma_reset_rings(uc);
 	}
 
@@ -2374,8 +2374,8 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	/* Release PSI-L pairing */
 	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 		uc->psil_paired = false;
 	}
 
@@ -3694,6 +3694,14 @@ static int udma_probe(struct platform_device *pdev)
 		ud->soc_data = soc->data;
 	}
 
+	// Setup function pointers
+	ud->start = udma_start;
+	ud->stop = udma_stop;
+	ud->reset_chan = udma_reset_chan;
+	ud->decrement_byte_counters = udma_decrement_byte_counters;
+	ud->psil_pair = navss_psil_pair;
+	ud->psil_unpair = navss_psil_unpair;
+
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
 		return ret;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 767b73021390d..16de0b218d8ad 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -348,6 +348,15 @@ struct udma_dev {
 	u32 psil_base;
 	u32 atype;
 	u32 asel;
+
+	int (*start)(struct udma_chan *uc);
+	int (*stop)(struct udma_chan *uc);
+	int (*reset_chan)(struct udma_chan *uc, bool hard);
+	void (*decrement_byte_counters)(struct udma_chan *uc, u32 val);
+	int (*psil_pair)(struct udma_dev *ud, u32 src_thread,
+			 u32 dst_thread);
+	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
+			   u32 dst_thread);
 };
 
 struct udma_desc {
@@ -618,6 +627,9 @@ int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
 void udma_reset_rings(struct udma_chan *uc);
 
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

