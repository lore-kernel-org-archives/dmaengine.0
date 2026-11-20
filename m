Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167263;
	b=4SCJiuhebxa/iz57bB1r4X2QAfl9BDD7nnL2zBVJls+L9mDAk/f2DC6ehW4chxnDqhd6
	 sudLWMB8KLY461oqUmygu1xmZXvjELX92b5X2v7Ew4FS7/u2StrdYnV7iwUoYN61/yKnp
	 mRh/fVTiGjcmkHv97Na1Ak6aPcOf6Q5+eUkPH7k6MxTYP20GGeIGov338DN+aT+tied5/
	 M08C9KZTGGwZK/3WlfhHPcSLjlg1oryjcuqA8WBtNcUyY5UzInXrE2VIZqj5CPrlKRf9l
	 6eUQIr9OgdizSSyKp8K+N7YZOJdfEtkmb68eBAUO1KX3H/pi+yLKDDbmFZRufLnIWEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167263;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FyhXCGx1D5FQ/QjssCKzHZAG1k4JmZiWIiy6DahHUjc=;
	b=en0vTd7zyqb2sGKqskqlDxLJEXTh0muf2qv8tPhnlJ20CWq8qwpfcD0GTCsC+KTsNK2f
	 bdQsZLv3+n/1i9VHESx39g1iyXW85bAV0/fv+wW4Ntr+YE9pL/xu7Wh6EbLIwdl+agXsj
	 5a1zR7HOtR5yS/AjUZwLpWUhnc1Q5gIOVuPRG2RzCr5upZjXDP9FP0EjRgO3ZkOffEJ6+
	 t/fbLpNK6UziueVjFC1U2vxs4ccNZCrR2eWHRLH7iPSyo+okZbKB7sldST3MEuF48FfPu
	 bwdsbYZdAXcaxsgFcorudvIrKUZ4RoUSZeqj4rvTjLvv/BISELjjx3PJ0DKwj6rb0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oISNH2kC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672360A2605;
	Fri, 20 Nov 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oISNH2kC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532651F000C4;
	Fri, 20 Nov 2026 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167263;
	bh=FyhXCGx1D5FQ/QjssCKzHZAG1k4JmZiWIiy6DahHUjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oISNH2kCDFfauqXANsmJSk/43zxI4r0lfXyp0NuWeSttlGl7XSnlkBJpEzuF8Vj/0
	 g+hnR7q2NBJegHWgQYOt5ITx0NOVVPIUSJU9WQ6OhlP9kNaxPKHbftoUYGFWbARbol
	 SWNd+aogNGmnPgQjQhMzzsHP4PEKvaNAQuYJwWdUWjVNSTFOzpiPCwlTfg4kvOpfiT
	 8kfKpAbZ9TOhamN+awIe3YEz6hrdzf+fJth3E1yY5P5rlZ/RCE8yogejQSLyBasnmS
	 KN34cCzfuG/mvDuN7P/iyi4n6W4cK1WnYyjiOfD0qDUd3qbOfX04zOb0g5/wRQ2tUB
	 S0YRAcAfAYQ3Q==
Date: Fri, 20 Nov 2026 15:04:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: rolanddreier@rivian.com
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dmaengine: dw-axi-dmac: Fix LLP search, error
 reporting, and error dump
Message-ID: <awAUG_fO8eAkQq-c@parshuram>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>

On 06-10-26, 01:03, Roland Dreier via B4 Relay wrote:
> One patch that build's on Jia Wang's fix for error-path LLI dump: the
> same bug is present in axi_chan_block_xfer_complete(), although it's
> not clear that it could ever be hit in practice, because the llp being
> searched for should always be found.
> 
> Then two fixes for failed transfer handling: one to report status in
> tx_result so that clients can know when a transfer hit an error, and
> another to make log messages more informative than "Bad descriptor
> submitted".

This fails for me against current code, please rebase on dmaengine/next

-- 
~Vinod
