Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDF837B413
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921979; cv=none; b=T7TxEu0G0mEnDCLMLt3JjLvIXF3vfsulT9iYbR9leXpt/CefteWGnNa1Ml4Le844j0VcKY1DjASa2PLz+5Llmv2HKRMy3yOpAyARoDYKO2zfdYUACIFrA7t99uD2ZTQgReAnz4rAudWL/JA49gcadP+5PV1xfiBe22OUciXR1Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921979; c=relaxed/simple;
	bh=e+ZZvSMAPktA3OHUbCx7isqHr68J1bCkhHZmqIbavb4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=RDhayWnFjEsikgCHW3BdtxrOL6eQoVEXP0KJfV6Ax+yq+g8IuvBnL+DAMNnF9Gqb2rGjVGU+YcAv6oJ/atvD1x/Gwl2TipCLhVHO3ngLtsfBzDrpqfzqbhDIIyVfBHutfIGbQUskrnh4TSyxZktrVKLvsT+dOrx66SxGmP96o1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=Chuohz0H; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="Chuohz0H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=t8gQa9nVrGyl3THjYZsn2e7whR3G0B7pKTQKIPFWWJw=; b=Chuohz0HzmdrSUnsOQplfxH3RN
	waJlkwNzMgLPOD23O9/VrxTFNP3U+FP2LAn9pDBCv/VCosfgwoAYCCKW7FoCKdA2B5DM/+VrrGPgl
	IO7nXX+MJ4cdPKe/pd/dmm2Pp6+4Mnib5YkeoFJgMyvUUq57ba/gPCPPnJpaMKDMByoj1SVgnLfqa
	CXFoN82yTA+3dJzO1mfcenE7Ierxv4ZpgxXANgkv7aAmBPtvL2r1lGtPVoM0PYb4TQtdkKUCQlwls
	hn7XKGpT+PElNcI/5mmSXdYejul39nx2tmADZT0whVxOlUUrTHBekpGnTb8t2NK5g5+5ElZhkTKQ/
	DCXPwUvQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xGilG-00000005VWl-447J;
	Tue, 13 Oct 2026 14:06:11 -0600
Message-ID: <8d7210a3-1482-414e-860c-68ebaea44784@deltatee.com>
Date: Tue, 13 Oct 2026 14:06:02 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-7-wsa+renesas@sang-engineering.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20261010124348.19055-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: wsa+renesas@sang-engineering.com, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH 6/8] dmaengine: plx_dma: unmap descriptor before
 completing cookie
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-10-10 06:43, Wolfram Sang wrote:
> To ensure that buffers are flushed, make sure that the descriptor gets
> unmapped before completing the cookie.
> 
> Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I've reviewed and tested this patch with hardware I think they are worth
taking directly despite Wolfram's reservations.

Tested-by: Logan Gunthorpe <logang@deltatee.com>

Thanks!

Logan
