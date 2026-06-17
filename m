Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B952D94AB;
	Wed, 17 Jun 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705826; cv=none; b=fV6KbprxmRdvgzbbrK06JFmmYcdODTn26+7SDN46veYhy0h8pcujRm3ZAFyl2p3bGLd8YGCXDQg8TWfQblqVfdWt7W0W6lhCBHkFaDR4b/BzKisPQ2MtKBlSUTbTpNHbTy6MHbug9arb1fzvAztCGpAsCFOke7mrUgb7tEGqkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705826; c=relaxed/simple;
	bh=DjStoZh2m++pd3XFvzAMSxDkCSnNF/78Vubq68dW5EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVSbTCdCzJcwYcrzNGIl3nXj57XCRLQyZYdhJ6/uteQBJNxxugYh1NRUgawiiWo/yaJafDdYU4GvBuox+JSpa++9sXbRlclBtcSfYfW+Z8wpjkTP9sOWLLiT6zEYZU60eOKCskVjmAjRsNslMp77KbXoEkw03XcWZ+16SIH6ooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=NMQaixZF; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="NMQaixZF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=DZHyrGKs9JSSI4KSTYREPjDkA6jion5rQBVc5vd2N1A=; b=NMQaixZF2QsxuQWA
	O8lFSt2CRo5+OnT/jnRAXrEdFZSuhNC43Xrg5K96osWMqN+ZGn0S8cxmIGVpQaaCQt45tGvC+nDB1
	bY2dTf/KdU3jhBLzfFkXa0IWzmavTsOwN+TV5YkXIxdD7rzvOtU8OyB2gWK2CGjHbusPuOFRzVpsx
	5keAEbR2EBmlJOBfiXIDfNSYlpAOpYBLKTYhNCr9nopAQngbF55csA0KW6NQfYQXD10zj5DmREdkI
	EMfeE0sDnnbf7hzNM8i/GKfFBBJPwErxOOAYMpMuMaSzDgIoaA6gBkASLjI+tZ9voO0UiEqgszcrw
	IuMvgp6NxQ4RRbceeg==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wZr4e-00DdOk-IR; Wed, 17 Jun 2026 15:17:00 +0100
Message-ID: <d4b84ec3-b91f-4bea-b68d-d0dbda36d29d@codethink.co.uk>
Date: Wed, 17 Jun 2026 15:16:59 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix __le32 on set of
 CH_CTL_H_LLI_VALID
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
 <ajKrN7UeLxlUKY8V@SMW015318>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <ajKrN7UeLxlUKY8V@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 17/06/2026 15:12, Frank Li wrote:
> On Wed, Jun 17, 2026 at 09:49:43AM +0100, Ben Dooks wrote:
>>
>> When writing the lli->ctl_hi, this is an __le32 type so the
>> value being orred should be convered to __le32 by cpu_to_le32.
> 
> Not sure if it can pass sparse warning check.

This was fixing a __le32 cast warning from sparse, forgot to put
the actual warning in the commit message :(


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
