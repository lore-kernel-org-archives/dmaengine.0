Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021134.outbound.protection.outlook.com [40.107.74.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B9424D66;
	Thu, 16 Jul 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215527; cv=fail; b=dXuks3t21CErT0mT8VyZxeiPXg3HtdcPOYrYiQve4jrknoUrAfe3s+d2rtE+OnCvfZtiXuTkDFnD21bPgerb9UIJ3UL0pWkOyHBmZPGifmxvToISIodbC5b3lzg3+e9m0TNLcxzk0YWa419oPspghpUW8N0ehkEXycXbvOzrw6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215527; c=relaxed/simple;
	bh=b04DAAA6z8mDQOrxaqUPTYxnJ3T+JwG5/r9WhoA41E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LwNnPikQ6XPJKTAIA2W4CtKiQBLfcA1AiUWsh/Z8CV7EVdchzJc7mxM+3CVxB+w+baQZ7EbQIOy8zoo+15qDyDdpCkt+5BBiXB4HpALwfNUQkiUEH8H37hPIgo2AaczQuKPWmxq/oXcjLERg8Vky4mppkmqG7T7vjTOzN7+fkKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Vl4kk7zH; arc=fail smtp.client-ip=40.107.74.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Vl4kk7zH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/w6YaoIk7rz4iVg2v7OS5Vfab5rb+t6qZrL94bAj7kaNha7i6X4dB7gdfIKGrhp+h5riY+H2xguQ9FcImLUye6AaCgqlRHVobCZe7eIvhwaJI2qGXv1Z5doOMMwGLcL2J8lccuorOo8Subb5h2nb+dJCd9PJEcDiZ06c16TEeI3ky0mrKggbJ9cEUGeqNvvGYUSy/h7vyGMszfb0CXe7r77gaU3gbKgRbVAf03ftOBb98xqhwHFv+ZiDDp1jrfoGREkteM3ljjNviTyjqfGzBnHk4Cb9edySvS10IvkVVjtRXxBz8L+ZL/jRshRNJ7WYd9EjY9TjgqTxB06gIxLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxwacdM76OOCOdsLxuwzYvGKu/KWzCe7FsFlty3pjn0=;
 b=rV8QKz0QshZLWl/KQ82PRncxRNhEFs0Tb7y7FzGs22kIlmRdP0v6ejbIU7doedSyCVC1qpFxW9ukVk1pu8uJ2m/9k0kuZx4Fp2Dvpm0CBxtKUpDO5+SKUT3W3JflsxpTJZOX1N278Qf+AC+swaYVmtPD2frt8kDKWu1fvAFO6ooBT/JAef9In9WGRV+sx14ygqHw4/796p168PmxbMjSrFVPdQVWdSkN1KYCpvpLiOFO0TXnGVIiOdo1MbCjOeR152D4SIQIgND6nLwX+LMyBVY1P+/+QitgafER19+Ci5/iWOa7qnQ0DRTtdfjRdk5BsM+FMI3bDrpc6zZXIAyx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxwacdM76OOCOdsLxuwzYvGKu/KWzCe7FsFlty3pjn0=;
 b=Vl4kk7zHC97xhb8YPeKMvCl4ce+jMoModR41XoKNiMoooahLUhjnKZhBi/fKyqBmCM6Ir2mkxmifz7FFUEj+nCvKKoYDRYywd3py+5TanQeX1mh4d9ZPMVkRrYjBtA3qMbBJikGlJYCNR5nsCkbpaOSHPyIQp4H4vzgBv8k9BLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/9] dmaengine: dw-edma: Clear stale requests on termination
Date: Fri, 17 Jul 2026 00:25:00 +0900
Message-ID: <20260716152503.1747922-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 83af7388-8c05-4d93-251d-08dee34e7219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tdzuUVDvvW5wOkHqrIG0dq9PY3lOVGmJ/zkVh/BwpMhaP+iBlY5/GcGL3kB2IsPWTgOjSA1mpzsSpzki5D5UOfQo+A+T8kavH9xXllRSVTxC37t89saRQ2OMR7ASSFTEaXLJP1cimXTeRb89Z1AC8WGt+rKfuLCZEgUrPYFOPfslsM1Wm+gBYoVs7i25Xo2umgTqfd4Y78V3t1N+5+VPF5rJ1YQtfWvY1qIUhyjYHV/hVFChT4pVU5KIue1r/L4KRfp8lrVU66Wfq9ZsXGgNOoKR23f93EZhHRi42QQgVT6ISGmea523TvgTF6x+mQnyFOTp9iq3O8hqOkx9rEvTV4SoB2CPafUdmd/IWw1hEdPqvMcDmkiyFjvpcHzYmavjWeoXgPd6L8SP61Qz4XjM+ayK2GvIV7i6yTmqRdCZvMfz+0zzJ9MIWbMGxabmv4rljeUz5LtQ+dOMkweEtZP0ZWvgx2pUivEmYal7ebVw3HLutjhXGgME/6FApsnMBGElkd2UaqyTYH9qULxaXdmiCXd6TyP7XZqjAHGxHbXMcEYj4PLbgA2hd3JlYpRpPVQMEdF0g5RcKO30OENci+aoLvPPC5V/X4xUo8w0MbfUsAQXs/SVEP01yIIEJaozVqK9qL2Uit0ybSeN5qU+4c75Ttpbh15Qa4+6GmWB632a1MU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y59fx4u+5WU6sNRoGXZ/WHidLn4DvLKwCK5mZJ82bpVJKgjEJVT9GS0FdwIr?=
 =?us-ascii?Q?351xkKWkd1s7VNk8WO8oNz2A/7z0GSzmrtQoUiJYm/5h3guRXjMFOV/smLcY?=
 =?us-ascii?Q?058ARV/UM7Br3YzF//Wmndxv/kCqqdQ2/n+YSJKrlyT6N97oLqLDEPvgLDxX?=
 =?us-ascii?Q?YQom+k7FoQ1Lv/zqpf+eAamgX1qt57O+W8aLE7+be8FJI3UaIJle1NhzvGMa?=
 =?us-ascii?Q?xX12/kAWHcEC+biOmSSLQCxrctmzVUUpFwrVqo//NXHZX+focW3KWgWVhmxJ?=
 =?us-ascii?Q?d18+WsVhVWyWWy3DrGZPbsGS4akRXwivDfGqNqbJF2EloVq5AcaS9yhI9MHJ?=
 =?us-ascii?Q?wtN5pQnPKiZ1vfFuqnRPztVo3KgHUGqFwUJIC+AlttEPLxCcEGaYvnEzhC+C?=
 =?us-ascii?Q?h3r5zvIDREs19JR5J4N8Pqb4r8Lvpdt0BaNIH75kPZ+t7XzwF9qnwM3NhruB?=
 =?us-ascii?Q?9hNevF/sfZ/m+D805VqgiRsVa6NXfUeDqFDyi7O3bMBE6erL4+BaVm5F0P11?=
 =?us-ascii?Q?aOzhDsyAfHcnGCIpI6wKtfGpAUhcvo0cDU3OZOkG9u+gn2mLbEFvW7AZQCD9?=
 =?us-ascii?Q?hFSfdQO+r/Lks5W1QmrRJ7AhfOKWsskP4rkDrOSyw6usJ1Tu5cUfKlcyWuXi?=
 =?us-ascii?Q?w4Vs+DiogJ62Vv8lMKqA+QX+QG0dhwbztDQ8Y9/0M0hwde/s7EZEzX29flk8?=
 =?us-ascii?Q?D94/uY9tMujrTDjkzB7KXvAFcqnI4zbTAbzg8k9cx4dL1QtxDpT/N0L/RZe9?=
 =?us-ascii?Q?dup3yHIMkUvueLQ1fumAXgERipJaFTd78cXOnks0jWOv3X1+NZJ5NzKdkQoM?=
 =?us-ascii?Q?rZyP3NQLJqmIuuOXAYMkj+vjqhsHbDrPrz5USsEdKANw3enpbHwll4B6MM4h?=
 =?us-ascii?Q?+gZCT+Tgg1cueCIRTPosMypFHXc+G/liDr6itY/M7rWcY8hlh4JvdzGqROQk?=
 =?us-ascii?Q?vAyBU/q63SSWep8zozl4ehOU2BRwtaX6XSUckJ00R8f+qaoMqzNp+Vw9+u8s?=
 =?us-ascii?Q?qSw1DOM7NwF1627jmu0feT3Iuwi/Wy63MqyM7l41+C5gvP0KLXzfGugrMdBa?=
 =?us-ascii?Q?MwbrqVpMRbgfrYLhs4sFQdLoFelJebXQZUgAnkuIslAHCAZ7Xb+pfpEgoKX8?=
 =?us-ascii?Q?ouCzlh1HoRi1cnzpEQDHz40DPs4FDCKtCZytfCbivP78/rVsIrSx9YuLRcpO?=
 =?us-ascii?Q?8weRWhU1t6qdW3p6fCBeskj5OUTcIovmDWeoXNEKWh6sfyMVWK1TTHiOb5XC?=
 =?us-ascii?Q?4b8rh+ST5tmsIE0zF/LETECmq5wr4R/p52NyIVMpWUnfqHVBIcGTAr/wwLhw?=
 =?us-ascii?Q?0BD+ir3ry9vW2L0XuRlThDDuSSHPUfLzqPDRU+Opni9SxhygrYCJn4sud0WE?=
 =?us-ascii?Q?jCBWwAOWP2ZgsBjHrFmWREnsVGvPPgvqw6jhWwYkZxH4gtUchtPc/W2s4Hf7?=
 =?us-ascii?Q?eRYUY8uzOiFdwFkriESRCrQEm4joSvol5FL623ajOUh9irfDsCQyjH/FQCEp?=
 =?us-ascii?Q?uzGOWVzngOTJzPD4blY0L6zRc2SMTfobWLCxYMqs7fPwa/gKsgpPVobToDju?=
 =?us-ascii?Q?gvKKBpAh5ZXmFnG1WeV5Ekt4YCKvxGz6c+x3M7+Z5nC0au/Ry83D//p+sdEU?=
 =?us-ascii?Q?EFpv5PBbEKk/AIYZrFPGqYn+JxkywDKtxKB8kH/jN1zc/uVx86uv4iDDQwCr?=
 =?us-ascii?Q?DLjDGlFL52GRV6xzhAZzWRanz2NS2ZNWEQcezQa6KE6ki3n3g8tgUlHc3SkS?=
 =?us-ascii?Q?gA7OqP4/uR7+l2OhfYn6IVr+0rw559FNgzKD10J8sfCxqwy8gVAq?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 83af7388-8c05-4d93-251d-08dee34e7219
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:19.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0LM4pNUEiFsnrQvXbERFH7f3V4uL6ZW1Nzxr+KG8NhbmJ7BRmYh8Jwxw69RY98MrjEIDty9Rjktxq5GOfwJuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

terminate_all() can finish immediately when the channel is unconfigured,
paused, idle, or already stopped in hardware. A pending PAUSE request can
survive these paths and block issue_pending() even after termination.

Clear the request whenever termination leaves the channel idle. A running
channel keeps its STOP request until the interrupt handler consumes it.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Collect Frank's Reviewed-by tag and adjust context for the preceding
    patch.

 drivers/dma/dw-edma/dw-edma-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 64ace6b9ebdc..b76f0aeb647d 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -364,6 +364,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		chan->request = EDMA_REQ_STOP;
 	}
+	if (chan->status == EDMA_ST_IDLE)
+		chan->request = EDMA_REQ_NONE;
 
 	return err;
 }
-- 
2.51.0

