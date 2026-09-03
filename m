Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C114E80C8;
	Thu,  3 Sep 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451705; cv=none; b=Kym1Lr354NkUhVAJG4mrH8GMWlD9mDfDsA6HzJ1VY1sU2TvQgno/itktxKle5obdlSHwW2YzQsQ9ADWH/LIBrcQGrT0ETp+gK2rgkuNOQ3cPAIromjxG3JH8Jjw4LyIGP7nWfNhUW7EdsYzNz88oDITdzi60VLjGkRzi8se1ASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451705; c=relaxed/simple;
	bh=DxN8Hyoam5c0GZ2624uWMxajZpHQfc6Q7Yblf8SgrUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S273gbjX4ar7IymgaoZLtotusVkLb7Y9xwZyABaH9QTQfnqDhZgpUXz1KGym3vJKmvCgxxx82yPVENivfqzQ/mNEDy/JqkCo3Ng1pgtIUzmFY/cIZl+JnN3AzasXBKbuh48VNZ7upbNe+HCjHD6DJkdGebPMilNnHOMPue8xfGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oa/hzOSu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oa/hzOSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE13D1F00A3D;
	Thu,  3 Sep 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451703;
	bh=RXaT6lx0rhnQm+iJAkxisCmWA+MWiEkz5wZYq6QWGXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oa/hzOSummlOrPk+3seebxJI8Znj9p3bA7J+e3lb6cwQce4ux9UJoEgGYmjNJMkoh
	 P+Wji9Tdw1BQlXaMWmLXcpwrfbXz8Aiwpkx2JL1f3jEppr+dDlLDzIdxSEvYjSKImv
	 TPowpZLNhSZQYFTyM+eb5jwsotrCzhO5rjB3M01K2TJ9TjOAKT9HPYLvHz9TdPYlU2
	 D1gY7XQiRFWYx+kleRTkAR9jFBnplk5dUMVaLWMgEFjI1LOn563wLWN+mAWYaAu0YN
	 K29cJu8fMpIuylC+gz1QbOsD9WGVgX+F5ZMRv05zCzJEbmIcOzA70hSaP5bERAmjRb
	 HrznozOqCZNTQ==
Date: Thu, 3 Sep 2026 21:38:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: naga chaithanya <nagachaithanya9911@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to
 clk_bulk API
Message-ID: <apmbc04cjkoM8ijy@vaman>
References: <an3y4lS-ZE4CdJ7R@SMW015318>
 <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
 <aoYCgWfzCmjT637e@lizhi-Precision-Tower-5810>
 <CALFZYQUrxNp3W2WvL0oWWEKUFxKnLyfbYyOzE3aNBWWG-pf0kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALFZYQUrxNp3W2WvL0oWWEKUFxKnLyfbYyOzE3aNBWWG-pf0kQ@mail.gmail.com>

On 20-08-26, 08:32, naga chaithanya wrote:
> Hi Frank,
> 
> Thanks for the review. I apologize for the threading error and will ensure
> future versions are sent as new threads.

and DO_NOT top post!

-- 
~Vinod
