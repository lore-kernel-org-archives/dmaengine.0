Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ADC3D9DD4;
	Fri, 17 Jul 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291167; cv=none; b=mQFufk8OJ4q1Wi2HkdRtpdWJ+tKjqWrreM4o1S8zym6EeEBCU5yEKM/kxCDgZtTVAeVSznjdD0uPpaDyrQ+KbZqKSk7bpJaNnefh7lYgkrWD4mLKCqLs0A23J32bJ7NKQOeHMpQuPei0JR7/oF0nLsoGbMyQYVZxqF0gNqsChDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291167; c=relaxed/simple;
	bh=59BW7XUuCJF6b0URlF/eeU8WFwGL3YRzQpZrP/7O1n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAiw6WtFVbukCCQM4icnTET7OUfp2rLPsfWeNs7NW8IoX69AeMfuYvpzMEUhKpcySx9DqkCTF9MAFlGzwD3G2SFZ2y7LA8ogXlotsCqW2/pGnDBS8SR2o+T6Yb35ONygb7bL//dxcBhdeVv9hB8CVn/ENO244J3eia3Wtgyba60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6NS7/VN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6NS7/VN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3081F00A3A;
	Fri, 17 Jul 2026 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291163;
	bh=Zv6fV9VNX+JdpShESLrJLeVhg8ac4lshdyYencdWapA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W6NS7/VNus0avQVqx8tPTuoVPfgpkhg8EIGogP/Vj/D8mWtL9IblfRSwoJ9wZyezG
	 tth/waY6E56us9R1ebMazCdw0aqeaYAL3Ws3jeyomSwRcejUF3mDGqnIx6eNGWS0Cg
	 wr57AZyWLWEF4dpicXlvgIibPkpuUDA/6tvptrfIjr/Vl0bFTV0Dx7qi3tOqAD2g55
	 slmCrO/NbK3LoUnn8WmDTyP6yu/3O/vLua1erVKyBU2vffRxg7Xv6VL3Jbh66WH7W1
	 j1nKR2V4gsQuXu/9g+mhXhjBmrAfJGxse6sbebCDPOlIKMUes5CDroesOLxGpcKeda
	 yvSrxh6Ynsd7A==
Date: Fri, 17 Jul 2026 17:55:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA
 (part 1/3)
Message-ID: <alofV2-d8v7DWkk3@vaman>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>

On 17-07-26, 14:02, Koichiro Den wrote:
> Hi,
> 
> This is v5, part 1 of three series for PCI endpoint DMA.
> 
> The three series are:
> 
>   * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
>   * part 2: PCI: endpoint: Expose endpoint DMA resources
>   * part 3: PCI: endpoint: Add PCI DMA endpoint function
> 
> This series prepares dw-edma and dw-edma-pcie for endpoint-local DMA
> channels delegated to a PCI host. The generic PCI endpoint interfaces
> and endpoint function are kept in parts 2 and 3.
> 
> v5 is based on next-20260715, which includes Frank's merged dw-edma
> descriptor-flattening series. Parts 2 and 3 depend on this series.

Sorry looks like rebase is required, it fails on patc2, which I resolved
but failed again at 4...

I should be pushing updated next this evening...

-- 
~Vinod
