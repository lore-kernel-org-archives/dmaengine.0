Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0237B413
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921982; cv=none; b=C478HmNf9soSRVojJs6r/p2eLLQz6EIMmcqwA3EVs0SBqoeLpBiw4f6QYWyK9mUquf5jzV49rY+mhAHHZ5quYicymvv09a5+3rN/LMGmvc6k7N/yqGyVucMA9IiWLQ7mULgS71jf530U1W54oja0XvDls+tFRrsHGzn4+uX4f5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921982; c=relaxed/simple;
	bh=yEmxvdzFPWZ0zz7ZdXj8EDiCD6oQZnK2JGMYe3Cft2I=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=DBIKHQdwGuleuick4v/P+7sKhB2wj+ctxTJbLFEy4v8gjP/mB1EPFT2x1bMS9R9Z8vEkD1QkyYezJmuXmKazhXLIyxsPDYzo685ShSvAUCvtcLdoXlTPi8K/4L/tEjP3pLwu7CMp6gPtblssoxxZjrotDJ+V4Zzg+4QF7YXdk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=dya5pwzD; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="dya5pwzD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=o7fVnPiNRrI+PdMQCcgNpmUiv5RYEvPcp+ofCdO0Y3c=; b=dya5pwzDwDFskA2CcrJOvp26Hx
	Jkw/s5HNC+zAJTFCCtL1eQD3/RpUNy2UHxfASPYFwMC7ejxU//2wXPah83rvO8pbTB4bWYtGdbvMF
	DzI+4aVcYgD7zg6+0gk256vbpRzpPRAYDoAPhM86HTqdU07B+p8PVHIPlybnHE7ICEt7LDE4OWJ4H
	kbj1ZfhhzzBkcUDR+3Xy3fPDzitWTCIFnBvsaHrZTkMPxkLRg27HjuD+KSk5CUCN7fMl7V/SLxElr
	5Z7PTAOq+HzTPKc60J+nwBPqcai4bpU2AbbyHfDwGH8W92upR14VjDlNyFVivG590PPfgxyM1AEFe
	a9jk3zaQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xGilP-00000005VWz-3sPT;
	Tue, 13 Oct 2026 14:06:20 -0600
Message-ID: <bb3599c4-f7e0-4856-81f9-b18cd27292ee@deltatee.com>
Date: Tue, 13 Oct 2026 14:06:19 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, dmaengine@vger.kernel.org
Cc: Kelvin Cao <kelvin.cao@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-8-wsa+renesas@sang-engineering.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20261010124348.19055-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: wsa+renesas@sang-engineering.com, dmaengine@vger.kernel.org, kelvin.cao@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH 7/8] dmaengine: switchtec-dma: unmap descriptor before
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

